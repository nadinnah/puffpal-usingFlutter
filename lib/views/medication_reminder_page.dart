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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      // Background gradient to match your Home Page
      body: Container(
          padding: EdgeInsets.only(top: 70),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFD8D0E5),
                Color(0xFFD9DBEF),
                Color(0xFFA8ABCA),
              ],
            ),
          ),
          child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text("Medication Reminders:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
