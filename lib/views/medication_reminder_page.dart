import 'package:flutter/material.dart';

import '../services/local_notification_service.dart';

class MedicationReminderPage extends StatefulWidget {
  const MedicationReminderPage({super.key});

  @override
  State<MedicationReminderPage> createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  final TextEditingController medNameController = TextEditingController();
  TimeOfDay? selectedTime;
  int? repeatHours;
  final LocalNotificationService notificationService = LocalNotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medication Reminders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),

            TextField(
              controller: medNameController,
              decoration: InputDecoration(
                labelText: "Medication Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        setState(() => selectedTime = time);
                      }
                    },
                    icon: Icon(Icons.access_time),
                    label: Text(selectedTime == null
                        ? "Select Start Time"
                        : "Start: ${selectedTime!.format(context)}"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      labelText: "Repeat every (hours)",
                      border: OutlineInputBorder(),
                    ),
                    value: repeatHours,
                    items: [4, 6, 8, 12].map((h) {
                      return DropdownMenuItem(
                        value: h,
                        child: Text("$h hours"),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => repeatHours = value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(Icons.alarm),
                label: Text("Set Reminder"),
                onPressed: () async {
                  if (medNameController.text.isEmpty ||
                      selectedTime == null ||
                      repeatHours == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please fill all fields")),
                    );
                    return;
                  }
      
                  // Convert selected time to DateTime
                  final now = DateTime.now();
                  final start = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    selectedTime!.hour,
                    selectedTime!.minute,
                  );
      
                  await notificationService.scheduleRepeatingReminder(
                    medNameController.text,
                    start,
                    repeatHours!,
                  );
      
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Reminder set for ${medNameController.text}")),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
