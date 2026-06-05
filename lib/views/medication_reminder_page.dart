import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../data/medication_entry.dart';
import '../l10n/app_localizations.dart'; // 👈 Imported localization
import '../services/local_notification_service.dart';
import '../services/sqlite_service.dart';

class MedicationReminderPage extends StatefulWidget {
  const MedicationReminderPage({super.key});

  @override
  State<MedicationReminderPage> createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  final LocalDatabase localDatabase = LocalDatabase();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;

  List<MedicationEntry> _medications = [
    MedicationEntry(controller: TextEditingController()),
  ];

  final LocalNotificationService notificationService = LocalNotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.init();
  }

  void _addNewMedicationField() {
    if (_medications.length < 5) {
      setState(() {
        _medications.add(MedicationEntry(controller: TextEditingController()));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.maxMedicationsError),
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var med in _medications) {
      med.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final localizations = AppLocalizations.of(context)!; // Cache localizations short handle

    final double titleSize = screenWidth * 0.07;
    final double subtitleSize = screenWidth * 0.055;
    final double bodySize = screenWidth * 0.035;

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.medicationRemindersTitle,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  localizations.medicationRemindersSubtitle,
                  style: TextStyle(fontSize: bodySize, color: Colors.black54),
                ),
                const SizedBox(height: 30),

                ..._medications.asMap().entries.map((entry) {
                  int index = entry.key;
                  MedicationEntry med = entry.value;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    color: const Color(0xFFF3F1FA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: med.controller,
                                  decoration: InputDecoration(
                                    labelText: localizations.enterMedicineLabel(index + 1),
                                    prefixIcon: const Icon(
                                      Icons.medical_services_sharp,
                                      color: Colors.black,
                                    ),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              if (_medications.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () => setState(
                                        () => _medications.removeAt(index),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              OutlinedButton.icon(
                                onPressed: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() => med.time = picked);
                                  }
                                },
                                icon: const Icon(Icons.access_time),
                                label: Text(
                                  med.time == null
                                      ? localizations.firstDose
                                      : med.time!.format(context),
                                ),
                              ),
                              const SizedBox(width: 30),
                              Expanded(
                                child: DropdownButtonFormField<int>(
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    labelText: localizations.everyIntervalLabel,
                                    border: const OutlineInputBorder(),
                                  ),
                                  initialValue: med.interval,
                                  items: [4, 6, 8, 12, 24].map((h) {
                                    return DropdownMenuItem(
                                      value: h,
                                      child: Text(
                                        localizations.hoursValue(h),
                                        style: TextStyle(fontSize: bodySize),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (val) =>
                                      setState(() => med.interval = val),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),

                if (_medications.length < 5)
                  Center(
                    child: TextButton.icon(
                      onPressed: _addNewMedicationField,
                      icon: const Icon(Icons.add_circle_outline),
                      label: Text(localizations.addAnotherMedication),
                    ),
                  ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E6096),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      await notificationService.requestPermissions();

                      bool allValid = _medications.every(
                            (m) =>
                        m.controller.text.trim().isNotEmpty &&
                            m.time != null &&
                            m.interval != null,
                      );

                      if (!allValid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(localizations.fillAllDetailsError),
                          ),
                        );
                        return;
                      }

                      for (var med in _medications) {
                        final medName = med.controller.text.trim();
                        final startTimeStr = med.time!.format(context);
                        final interval = med.interval!;

                        final now = DateTime.now();
                        DateTime firstDose = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          med.time!.hour,
                          med.time!.minute,
                        );
                        if (firstDose.isBefore(now)) {
                          while (firstDose.isBefore(now)) {
                            firstDose = firstDose.add(
                              Duration(hours: interval),
                            );
                          }
                        }

                        await notificationService.scheduleRepeatingReminder(
                          medName,
                          firstDose,
                          interval,
                        );

                        await localDatabase.insertMedication({
                          'userEmail': currentUserEmail,
                          'name': medName,
                          'startTime': startTimeStr,
                          'interval': interval,
                        });
                      }

                      setState(() {
                        _medications = [
                          MedicationEntry(controller: TextEditingController()),
                        ];
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(localizations.remindersSavedMessage),
                        ),
                      );
                    },
                    child: Text(
                      localizations.setTimersButton,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Text(
                  localizations.activeRemindersTitle,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Divider(color: Colors.black26),
                const SizedBox(height: 10),

                FutureBuilder<List<Map<String, dynamic>>>(
                  future: localDatabase.getMedicationsForUser(
                    auth.currentUser!.email!,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(localizations.noActiveReminders),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final med = snapshot.data![index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Dismissible(
                            background: Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              color: Colors.red,
                            ),
                            key: ValueKey(med['id']),
                            onDismissed: (direction) async {
                              final messenger = ScaffoldMessenger.of(context);
                              final deletedMed = med;
                              await notificationService.cancelMedicationReminder(deletedMed['name']);
                              await localDatabase.deleteMedication(deletedMed['id']);
                              setState(() {});

                              messenger.showSnackBar(
                                SnackBar(
                                  content: Text(localizations.reminderRemovedMessage(deletedMed['name'])),
                                  action: SnackBarAction(
                                    label: localizations.undoAction,
                                    onPressed: () {
                                      localDatabase.insertMedication({
                                        'userEmail': currentUserEmail,
                                        'name': deletedMed['name'],
                                        'startTime': deletedMed['startTime'],
                                        'interval': deletedMed['interval'],
                                      });
                                      notificationService.scheduleRepeatingReminder(
                                        deletedMed['name'],
                                        DateTime.now(),
                                        deletedMed['interval'],
                                      );
                                      setState(() {});

                                      messenger.showSnackBar(
                                        SnackBar(
                                          content: Text(localizations.reminderRestoredMessage),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Card(
                                margin: EdgeInsets.zero,
                                color: Colors.white,
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.alarm_on,
                                    color: Color(0xFF1E6096),
                                  ),
                                  title: Text(
                                    med['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    localizations.reminderSubtitleInfo(
                                      med['startTime'],
                                      med['interval'] as int,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () async {
                                      final messenger = ScaffoldMessenger.of(context);
                                      final deletedMed = med;
                                      await notificationService.cancelMedicationReminder(deletedMed['name']);
                                      await localDatabase.deleteMedication(deletedMed['id']);
                                      setState(() {});

                                      messenger.showSnackBar(
                                        SnackBar(
                                          content: Text(localizations.reminderRemovedMessage(deletedMed['name'])),
                                          action: SnackBarAction(
                                            label: localizations.undoAction,
                                            onPressed: () {
                                              localDatabase.insertMedication({
                                                'userEmail': currentUserEmail,
                                                'name': deletedMed['name'],
                                                'startTime': deletedMed['startTime'],
                                                'interval': deletedMed['interval'],
                                              });
                                              notificationService.scheduleRepeatingReminder(
                                                deletedMed['name'],
                                                DateTime.now(),
                                                deletedMed['interval'],
                                              );
                                              setState(() {});

                                              messenger.showSnackBar(
                                                SnackBar(
                                                  content: Text(localizations.reminderRestoredMessage),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}