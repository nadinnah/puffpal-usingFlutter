import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title);
  print(message.notification?.body);
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
bool isFlutterLocalNotificationsInitialized = false;

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    print(message.notification?.title);
  }

  Future<void> initLocalNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: AndroidInitializationSettings("@drawable/ic_launcher"),
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
            print(
              "Notification clicked with payload: ${notificationResponse.payload}",
            );
          },
    );
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }

    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',

      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    print("Displaying notification: ${notification?.title}");
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,

        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,

            icon: '@drawable/ic_launcher',
          ),
        ),
      );
    }
  }

  void initPushNotification() {
    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');
    await setupFlutterNotifications();
    await initLocalNotification();
    initPushNotification();
  }

  Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": dotenv.env['FIREBASE_TYPE'],
      "project_id": dotenv.env['FIREBASE_PROJECT_ID'],
      "private_key_id": dotenv.env['FIREBASE_PRIVATE_KEY_ID'],
      "private_key": dotenv.env['FIREBASE_PRIVATE_KEY']?.replaceAll(r'\n', '\n'),
      "client_email": dotenv.env['FIREBASE_CLIENT_EMAIL'],
      "client_id": dotenv.env['FIREBASE_CLIENT_ID'],
      "auth_uri": dotenv.env['FIREBASE_AUTH_URI'],
      "token_uri": dotenv.env['FIREBASE_TOKEN_URI'],
      "auth_provider_x509_cert_url": dotenv.env['FIREBASE_AUTH_PROVIDER'],
      "client_x509_cert_url": dotenv.env['FIREBASE_CLIENT_CERT_URL'],
      "universe_domain": dotenv.env['FIREBASE_UNIVERSE_DOMAIN'],
    };


    final scopes = ["https://www.googleapis.com/auth/firebase.messaging"];

    // Authenticate using the service account
    final client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  }

  Future<void> sendNotificationToUser(
    String userId,
    String title,
    String body,
  ) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        final fcmToken = userDoc.data()?['fcmToken'];
        if (fcmToken != null) {
          final accessToken = await getAccessToken();
          final String fcmEndpoint =
              'https://fcm.googleapis.com/v1/projects/puff-pal/messages:send';

          final payload = {
            'message': {
              'token': fcmToken,
              'notification': {'title': title, 'body': body},
              'data': {'userId': userId},
            },
          };

          final response = await http.post(
            Uri.parse(fcmEndpoint),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $accessToken',
            },
            body: jsonEncode(payload),
          );

          if (response.statusCode == 200) {
            print('Notification sent successfully to user: $userId');

            // Add notification details to Firestore
            await FirebaseFirestore.instance.collection('notifications').add({
              'userId': userId,
              'title': title,
              'body': body,
              'fcmToken': fcmToken,
              'timestamp': FieldValue.serverTimestamp(),
            });

            print('Notification added to Firestore for user: $userId');
          } else {
            print('Failed to send FCM message: ${response.body}');
          }
        } else {
          print('FCM token not found for user: $userId');
        }
      } else {
        print('User document does not exist for userId: $userId');
      }
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
