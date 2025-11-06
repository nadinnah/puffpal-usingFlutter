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

  Future<void> scheduleRepeatingReminder(
      String medName, DateTime startTime, int intervalHours) async {
    final now = DateTime.now();
    final scheduledTime = startTime.isBefore(now)
        ? startTime.add(Duration(days: 1))
        : startTime;

    // Schedule the first notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      medName.hashCode,
      'Medication Reminder 💊',
      'Time to take your $medName',
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'med_channel',
          'Medication Reminders',
          channelDescription: 'Reminders for medications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // Repeats daily
    );

    // Schedule subsequent reminders for that same day
    for (int i = 1; i < 24 ~/ intervalHours; i++) {
      final nextTime = scheduledTime.add(Duration(hours: intervalHours * i));
      await flutterLocalNotificationsPlugin.zonedSchedule(
        medName.hashCode + i,
        'Medication Reminder 💊',
        'Time to take your $medName',
        tz.TZDateTime.from(nextTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'med_channel',
            'Medication Reminders',
            channelDescription: 'Reminders for medications',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    }
  }

}
