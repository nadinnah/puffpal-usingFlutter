import 'package:flutter/material.dart';

class AsthmaBasicsPage extends StatefulWidget {
  const AsthmaBasicsPage({super.key});

  @override
  State<AsthmaBasicsPage> createState() => _AsthmaBasicsPageState();
}

class _AsthmaBasicsPageState extends State<AsthmaBasicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E6096),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.air,
                    color: Colors.white,
                    size: 60,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Understanding Asthma",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Think of your airways as roads. Asthma causes traffic jams by making them swollen, narrow, and filled with mucus.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// QUICK FACTS
            _sectionTitle("Asthma Basics"),

            _infoCard(
              Icons.info_outline,
              [
                "Asthma is a chronic condition.",
                "You live with it every day.",
                "It can be serious and even life-threatening.",
                "There is no cure, but it can be managed successfully.",
              ],
            ),

            const SizedBox(height: 24),

            /// WHAT HAPPENS
            _sectionTitle("What Happens During Asthma?"),

            _infoCard(
              Icons.air,
              [
                "Airways become swollen",
                "Muscles tighten around them",
                "More mucus forms",
                "Airways become narrow",
              ],
            ),

            const SizedBox(height: 24),

            /// SYMPTOMS
            _sectionTitle("Common Symptoms"),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(label: Text("Cough")),
                Chip(label: Text("Wheezing")),
                Chip(label: Text("Chest Tightness")),
                Chip(label: Text("Shortness of Breath")),
              ],
            ),

            const SizedBox(height: 24),

            /// TYPES
            _sectionTitle("Types of Asthma"),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                title: const Text("View Asthma Types"),
                children: const [
                  ListTile(title: Text("Allergic Asthma")),
                  ListTile(title: Text("Aspirin-Induced Asthma")),
                  ListTile(title: Text("Cough-Variant Asthma")),
                  ListTile(title: Text("Exercise-Induced Asthma")),
                  ListTile(title: Text("Nighttime Asthma")),
                  ListTile(title: Text("Steroid-Resistant Asthma")),
                  ListTile(title: Text("Occupational Asthma")),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// DAILY HABITS
            _sectionTitle("Daily Management Tips"),

            _checklistCard([
              "Take medications exactly as prescribed",
              "Carry your rescue inhaler",
              "Avoid smoke, dust, and pollution",
              "Keep your home clean",
              "Wash bedding regularly",
              "Stay active",
              "Warm up before exercise",
              "Drink enough water",
              "Manage stress",
              "Get enough sleep",
              "Avoid smoking",
              "Get recommended vaccines",
              "Monitor symptoms",
              "Follow your asthma action plan",
            ]),

            const SizedBox(height: 24),

            /// RELIEVER VS CONTROLLER

            _sectionTitle("Know Your Inhalers"),

            Row(
              children: [
                Expanded(
                  child: _medicineCard(
                    color: Colors.green,
                    icon: Icons.flash_on,
                    title: "Reliever",
                    subtitle:
                    "Works fast during symptoms or before exercise.",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _medicineCard(
                    color: Colors.blue,
                    icon: Icons.shield,
                    title: "Controller",
                    subtitle:
                    "Used every day to prevent attacks.",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// ACTION PLAN

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Quick Reminder",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Feeling well? Take your Controller as prescribed.\n\n"
                        "Starting to cough, wheeze, or feel tight-chested?\n"
                        "Use your Reliever and follow your asthma action plan.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: items
              .map(
                (e) => ListTile(
              leading: Icon(icon),
              title: Text(e),
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  Widget _checklistCard(List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: items
              .map(
                (e) => ListTile(
              leading: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              title: Text(e),
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  Widget _medicineCard({
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}