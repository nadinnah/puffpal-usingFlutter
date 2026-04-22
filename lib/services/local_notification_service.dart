import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class LocalNotificationService {
  static final LocalNotificationService _instance = LocalNotificationService._internal();
  factory LocalNotificationService() => _instance;
  LocalNotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    try {
      final String currentTimeZone = (await FlutterTimezone.getLocalTimezone()) as String;
      tz.setLocalLocation(tz.getLocation(currentTimeZone));
    } catch (e) {
      tz.setLocalLocation(tz.getLocation('Asia/Kuwait'));
    }

    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    await _plugin.initialize(
      const InitializationSettings(android: androidSettings),
    );

    if (Platform.isAndroid) {
      final androidPlugin = _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel',
        'Medication Reminders',
        description: 'Notifications for medicine timers',
        importance: Importance.max,
        playSound: true,
      );

      await androidPlugin?.createNotificationChannel(channel);
    }
  }
  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      // This triggers the "Allow puffpal to send notifications" dialog
      await androidImplementation?.requestNotificationsPermission();

      // This requests the "Exact Alarm" permission required for Android 13+
      final bool? hasAlarmPermission = await androidImplementation?.requestExactAlarmsPermission();

      print("Exact Alarm Permission: $hasAlarmPermission");
    }
  }

  Future<void> scheduleRepeatingReminder(String medName, DateTime startTime, int intervalHours) async {
    for (int i = 0; i < 10; i++) {
      int id = medName.hashCode.abs() + i;
      DateTime scheduledTime = startTime.add(Duration(hours: intervalHours * i));

      if (scheduledTime.isBefore(DateTime.now())) continue;

      print("Scheduling $medName ID: $id for $scheduledTime");

      await _plugin.zonedSchedule(
        id,
        'Medication Reminder 💊',
        'It is time for your dose of $medName',
        tz.TZDateTime.from(scheduledTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'Medication Reminders',
            importance: Importance.max,
            priority: Priority.high,
            fullScreenIntent: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

      );
    }
  }

  Future<void> cancelMedicationReminder(String medName) async {
    int baseId = medName.hashCode.abs();

    for (int i = 0; i < 10; i++) {
      int id = baseId + i;
      await _plugin.cancel(id);
    }

    print("Cancelled all notifications for $medName");
  }
}