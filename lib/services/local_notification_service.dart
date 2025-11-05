import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/material.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();
    const androidInit = AndroidInitializationSettings('@drawable/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> scheduleMedicationReminder(String medName, DateTime time) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      medName.hashCode,
      'Medication Reminder 💊',
      'Time to take your $medName',
      tz.TZDateTime.from(time, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel',
          'Medication Reminders',
          channelDescription: 'Reminders for medications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      // androidAllowWhileIdle: true,
      // uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, androidScheduleMode: AndroidScheduleMode.exact, // repeats daily
    );
  }
}
