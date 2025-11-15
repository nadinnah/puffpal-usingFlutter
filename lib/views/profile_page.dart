import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:puffpal/services/sqlite_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/app_localizations.dart';
import '../services/local_notification_service.dart';
import 'medication_reminder_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LocalDatabase localdb = LocalDatabase();
  FirebaseAuth auth = FirebaseAuth.instance;
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 120),

            Text(
              AppLocalizations.of(context)!.personalInfo,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildEditableField(
              icon: Icons.person,
              label: AppLocalizations.of(context)!.name,
              value: userData.containsKey('name') ? userData['name'] : '',
              onSave: (newValue) => localdb.updateUserFieldByEmail(
                auth.currentUser!.email!,
                {'name': newValue},
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.black),
              title: Text(AppLocalizations.of(context)!.email, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(
                auth.currentUser!.email!,
                style: TextStyle(color: Colors.black),
              ),
            ),
            _buildEditableField(
              icon: Icons.phone,
              label: AppLocalizations.of(context)!.phone,
              value: userData.containsKey('number') ? userData['number'] : '',
              onSave: (newValue) => localdb.updateUserFieldByEmail(
                auth.currentUser!.email!,
                {'number': newValue},
              ),
            ),
            ListTile(
              leading: Icon(Icons.perm_identity, color: Colors.black),
              title:Text(AppLocalizations.of(context)!.gender, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              subtitle: Text(
                userData.containsKey('gender') ? userData['gender'] : '',
                style: TextStyle(color: Colors.black),
              ),
            ),
            _buildEditableField(
              icon: Icons.calendar_today,
              label: AppLocalizations.of(context)!.age,
              value: userData.containsKey('age') ? userData['age'].toString() : '',
              onSave: (newValue) => localdb.updateUserFieldByEmail(
                auth.currentUser!.email!,
                {'age': int.parse(newValue)},
              ),),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 40),

            TextButton(onPressed: (){
              //Navigator.pushNamed(context, '/medication_reminder');
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicationReminderPage()));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("go to medication reminder page", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(width: 30),
                Icon(Icons.navigate_next, color: Colors.black, size: 30)
              ],
            ))


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
      title: Text(label, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      subtitle: Text(value, style: TextStyle(color: Colors.black)),
      trailing: IconButton(
        icon: Icon(Icons.edit, color: Colors.black),
        onPressed: () async {
          TextEditingController _controller = TextEditingController(
            text: value,
          );
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Edit $label"),
                content: TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: label),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String newValue = _controller.text.trim();
                      if (newValue.isNotEmpty) {
                        await onSave(newValue);
                        Navigator.pop(context);
                        _loadUserData(); // Refresh user data
                      }
                    },
                    child: Text("Save"),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
