import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class AsthmaBasicsPage extends StatefulWidget {
  const AsthmaBasicsPage({super.key});

  @override
  State<AsthmaBasicsPage> createState() => _AsthmaBasicsPageState();
}

class _AsthmaBasicsPageState extends State<AsthmaBasicsPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final verticalSpacing = screenHeight * 0.12;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E6096),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Icon(Icons.air, color: Colors.white, size: 60),
                  const SizedBox(height: 10),
                  Text(
                    loc.understandingAsthma,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loc.asthmaHeaderDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _sectionTitle(loc.asthmaBasicsSection),

            _infoCard(Icons.info_outline, [
              loc.asthmaFact1,
              loc.asthmaFact2,
              loc.asthmaFact3,
              loc.asthmaFact4,
            ]),

            const SizedBox(height: 24),

            _sectionTitle(loc.whatHappensTitle),

            _infoCard(Icons.air, [
              loc.airwaySwollen,
              loc.musclesTighten,
              loc.moreMucus,
              loc.airwaysNarrow,
            ]),

            const SizedBox(height: 24),

            _sectionTitle(loc.commonSymptoms),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Chip(label: Text(loc.cough)),
                Chip(label: Text(loc.wheezing)),
                Chip(label: Text(loc.chestTightness)),
                Chip(label: Text(loc.shortnessBreath)),
              ],
            ),

            const SizedBox(height: 24),

            _sectionTitle(loc.typesOfAsthma),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ExpansionTile(
                title: Text(loc.viewAsthmaTypes),
                children: [
                  ListTile(title: Text(loc.allergicAsthma)),
                  ListTile(title: Text(loc.aspirinAsthma)),
                  ListTile(title: Text(loc.coughVariantAsthma)),
                  ListTile(title: Text(loc.exerciseAsthma)),
                  ListTile(title: Text(loc.nighttimeAsthma)),
                  ListTile(title: Text(loc.steroidAsthma)),
                  ListTile(title: Text(loc.occupationalAsthma)),
                ],
              ),
            ),

            const SizedBox(height: 24),

            _sectionTitle(loc.dailyManagementTips),

            _checklistCard([
              loc.tip1,
              loc.tip2,
              loc.tip3,
              loc.tip4,
              loc.tip5,
              loc.tip6,
              loc.tip7,
              loc.tip8,
              loc.tip9,
              loc.tip10,
              loc.tip11,
              loc.tip12,
              loc.tip13,
              loc.tip14,
            ]),

            const SizedBox(height: 24),

            _sectionTitle(loc.knowYourInhalers),

            Row(
              children: [
                Expanded(
                  child: _medicineCard(
                    color: Colors.green,
                    icon: Icons.flash_on,
                    title: loc.reliever,
                    subtitle: loc.relieverDescription,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _medicineCard(
                    color: Colors.blue,
                    icon: Icons.shield,
                    title: loc.controller,
                    subtitle: loc.controllerDescription,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.orange,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    loc.quickReminder,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(loc.reminderText, textAlign: TextAlign.center),
                ],
              ),
            ),

            SizedBox(height: verticalSpacing / 2),
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
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoCard(IconData icon, List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: items
              .map((e) => ListTile(leading: Icon(icon), title: Text(e)))
              .toList(),
        ),
      ),
    );
  }

  Widget _checklistCard(List<String> items) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: items
              .map(
                (e) => ListTile(
                  leading: const Icon(Icons.check_circle, color: Colors.green),
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
            Text(subtitle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
