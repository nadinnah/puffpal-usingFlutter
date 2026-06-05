import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puffpal/services/sqlite_service.dart';
import 'package:puffpal/services/firestore_service.dart';
import '../l10n/app_localizations.dart';
import '../services/user_provider.dart';
import 'medication_reminder_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LocalDatabase localdb = LocalDatabase();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseServices firebaseServices = FirebaseServices();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<Map<String, dynamic>> _loadUserData() async {
    Map<String, dynamic> data = await localdb.loadUserDataByEmail(
      auth.currentUser!.email!,
    );
    setState(() {
      userData = data;
    });
    return data;
  }

  // Helper to safely translate database-driven gender entries dynamically
  String _getLocalizedGender(BuildContext context, String rawGender) {
    final l10n = AppLocalizations.of(context)!;
    if (rawGender.trim().toLowerCase() == 'male') {
      return l10n.genderMale;
    } else if (rawGender.trim().toLowerCase() == 'female') {
      return l10n.genderFemale;
    }
    return rawGender; // Fallback if it's already an updated localized value or empty
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.05;
    final double verticalSpacing = screenHeight * 0.12;

    final l10n = AppLocalizations.of(context);
    if (userData.isEmpty || l10n == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final String currentGenderRaw = userData.containsKey('gender') ? userData['gender'] : '';

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(horizontalPadding, verticalSpacing, horizontalPadding, 0),
        child: Column(
          children: [
            Text(
              l10n.personalInfo,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildEditableField(
              icon: Icons.person,
              label: l10n.name,
              value: userData.containsKey('name') ? userData['name'] : '',
              onSave: (newValue) {
                firebaseServices.updateFirebaseUserFieldByEmail(auth.currentUser!.email!, {'name': newValue});
                return localdb.updateUserFieldByEmail(
                  auth.currentUser!.email!,
                  {'name': newValue},
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.black),
              title: Text(l10n.email, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(
                auth.currentUser!.email!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            _buildEditableField(
              icon: Icons.phone,
              label: l10n.phone,
              value: userData.containsKey('number') ? userData['number'] : '',
              onSave: (newValue) {
                firebaseServices.updateFirebaseUserFieldByEmail(auth.currentUser!.email!, {'number': newValue});
                return localdb.updateUserFieldByEmail(
                  auth.currentUser!.email!,
                  {'number': newValue},
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.perm_identity, color: Colors.black),
              title: Text(l10n.gender, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(
                _getLocalizedGender(context, currentGenderRaw), // 👈 Dynamic DB text parser conversion
                style: const TextStyle(color: Colors.black),
              ),
            ),
            _buildEditableField(
              icon: Icons.calendar_today,
              label: l10n.age,
              value: userData.containsKey('age') ? userData['age'].toString() : '',
              onSave: (newValue) {
                firebaseServices.updateFirebaseUserFieldByEmail(auth.currentUser!.email!, {'age': int.parse(newValue)});
                return localdb.updateUserFieldByEmail(
                  auth.currentUser!.email!,
                  {'age': int.parse(newValue)},
                );
              },
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MedicationReminderPage()));
                },
                child: Row(
                  children: [
                    Text(
                      l10n.medicationRemindersMenu, // 👈 Localized navigation header text
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Spacer(),
                    const Icon(Icons.navigate_next, color: Colors.black, size: 30)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required IconData icon,
    required String label,
    required String value,
    required Future<void> Function(String newValue) onSave,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: const TextStyle(color: Colors.black)),
      trailing: const Icon(Icons.edit, color: Colors.black),
      onTap: () async {
        // Moved dialog logic directly onto the whole row or edit button target safely
        TextEditingController fieldController = TextEditingController(text: value);
        final l10n = AppLocalizations.of(context)!;

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(l10n.editFieldTitle(label)), // 👈 Managed using structural placeholder templates
              content: TextField(
                controller: fieldController,
                decoration: InputDecoration(labelText: label),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(l10n.cancelAction),
                ),
                ElevatedButton(
                  onPressed: () async {
                    String newValue = fieldController.text.trim();
                    if (newValue.isNotEmpty) {
                      await onSave(newValue);
                      if (label == AppLocalizations.of(context)!.name) {
                        Provider.of<UserProvider>(context, listen: false).updateName(newValue);
                      }
                      Navigator.pop(context);
                      _loadUserData();
                    }
                  },
                  child: Text(l10n.saveAction),
                ),
              ],
            );
          },
        );
      },
    );
  }
}