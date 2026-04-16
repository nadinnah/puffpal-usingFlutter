import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      // This specifically requests the "Exact Alarm" permission
      final bool? hasPermission = await androidImplementation?.requestExactAlarmsPermission();
      print("Exact Alarm Permission: $hasPermission");
    }
  }

  Future<void> init() async {
    // 1. Initialize timezones - CRITICAL for zonedSchedule
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        // Handle logic when user taps the notification
        print("Notification tapped: ${details.payload}");
      },
    );
  }

  Future<void> scheduleRepeatingReminder(String medName, DateTime startTime, int intervalHours) async {
    int id = medName.hashCode.abs();

    await _plugin.zonedSchedule(
      id,
      'Medication Reminder 💊',
      'It is time for your dose of $medName',
      tz.TZDateTime.from(startTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel_id',
          'Medication Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // REQUIRED in your version
      matchDateTimeComponents: DateTimeComponents.time,
      // Notice: No uiLocalNotificationDateInterpretation here!
    );
  }

  // Future<void> scheduleRepeatingReminder(String medName, DateTime startTime, int intervalHours) async {
  //   int id = medName.hashCode.abs();
  //
  //
  //   // --- ADD THIS: IMMEDIATE TEST NOTIFICATION ---
  //   await _plugin.show(
  //     999, // Static ID for testing
  //     'System Check 🛠️',
  //     'Attempting to start periodic timer for $medName...',
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'med_channel_id',
  //         'Medication Reminders',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //     ),
  //   );
  //
  //   // FOR TESTING: Repeat every minute
  //   await _plugin.periodicallyShow(
  //     id,
  //     'Medication Reminder 💊',
  //     'It is time for your dose of $medName',
  //     RepeatInterval.everyMinute, // This triggers every 60 seconds
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'med_channel_id',
  //         'Medication Reminders',
  //         channelDescription: 'Notifications for medicine timers',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //       iOS: DarwinNotificationDetails(),
  //     ),
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //   );
  // }

  Future<void> cancelMedicationReminder(String medName) async {
    int id = medName.hashCode.abs();
    await _plugin.cancel(id);
  }

  Future<void> cancelAll() async => await _plugin.cancelAll();
}