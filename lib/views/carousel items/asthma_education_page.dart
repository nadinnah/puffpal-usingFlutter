import 'package:flutter/material.dart';
import '../../models/carousel.dart';

class AsthmaEducationPage extends StatelessWidget {
  final EducationMode mode;

  const AsthmaEducationPage({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final horizontalPadding = screenWidth * 0.05;
    final verticalSpacing = screenHeight * 0.12;

    final isTriggers = mode == EducationMode.triggers;

    final primaryColor = isTriggers ? Colors.teal : Colors.red.shade700;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: primaryColor.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  Icon(
                    isTriggers ? Icons.eco_rounded : Icons.info_outline_rounded,
                    color: primaryColor,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isTriggers
                          ? "Staying away from environmental factors that irritate your lungs is key to managing asthma."
                          : "Track symptoms closely. Recognize clear warning points to maintain proper asthma control.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade800,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Core dynamic section list
            isTriggers ? _buildTriggersList() : _buildReferralList(),
            SizedBox(height: verticalSpacing/2),
          ],
        ),
      ),
    );
  }

  // Section 1 Data: Populated directly from Document (28) (1).pdf
  Widget _buildTriggersList() {
    return Column(
      children: [
        _buildSectionCard("Airborne Irritants", Colors.blue, [
          BulletItem(
            "Avoid smoke exposure (cigarettes, shisha, vaping, burning odors)",
            Icons.smoke_free,
          ), //
          BulletItem(
            "Stay away from dust, pollen, mold, and pet dander if they worsen symptoms",
            Icons.grass,
          ), //[cite: 1]
          BulletItem(
            "Avoid strong perfumes, cleaning sprays, and chemical fumes",
            Icons.clean_hands,
          ), //[cite: 1]
        ]),
        _buildSectionCard("Home & Environment", Colors.green, [
          BulletItem(
            "Keep the home clean and well ventilated to reduce allergens",
            Icons.window,
          ), //[cite: 1]
          BulletItem(
            "Use mattress and pillow covers to decrease dust mites",
            Icons.bed,
          ), //[cite: 1]
          BulletItem(
            "Cold air can trigger asthma — cover nose and mouth in cold weather",
            Icons.ac_unit,
          ), //[cite: 1]
        ]),
        _buildSectionCard("Medical & Lifestyle", Colors.orange, [
          BulletItem(
            "Respiratory infections (flu/colds) worsen asthma — wash hands regularly & get flu vaccine",
            Icons.wash,
          ), //[cite: 1]
          BulletItem(
            "Exercise may trigger symptoms — use prescribed inhaler before exercise if advised",
            Icons.fitness_center,
          ), //[cite: 1]
          BulletItem(
            "Avoid specific trigger medicines: aspirin, NSAIDs (Ibuprofen), or some beta blockers",
            Icons.medication,
          ), //[cite: 1]
          BulletItem(
            "Emotional stress and anxiety can worsen asthma attacks",
            Icons.psychology,
          ), //[cite: 1]
        ]),
      ],
    );
  }

  // Section 2 Data: Populated directly from Document (28) (1).pdf
  Widget _buildReferralList() {
    return Column(
      children: [
        _buildSectionCard("Consult Your Doctor If:", Colors.orange.shade800, [
          BulletItem(
            "Symptoms are becoming more frequent or more severe",
            Icons.trending_up,
          ),
          //[cite: 1]
          BulletItem(
            "Rescue inhaler is needed more than usual (e.g. several times per week)",
            Icons.replay,
          ),
          //[cite: 1]
          BulletItem(
            "Nighttime awakening due to cough, wheezing, or shortness of breath",
            Icons.bedtime,
          ),
          //[cite: 1]
          BulletItem(
            "Difficulty speaking, walking, or breathing normally",
            Icons.directions_walk,
          ),
          //[cite: 1]
          BulletItem(
            "Peak flow readings are decreasing or staying low",
            Icons.speed,
          ),
          //[cite: 1]
        ]),

        // Immediate Emergency High-Contrast Block
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.gpp_bad, color: Colors.red.shade900),
                  const SizedBox(width: 8),
                  Text(
                    "EMERGENCY — Refer Immediately",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.red, thickness: 0.5),
              ...[
                    "Severe shortness of breath or no improvement after rescue inhaler",
                    //[cite: 1]
                    "Silent chest (very little air movement heard)",
                    //[cite: 1]
                    "Lips or fingernails turn blue",
                    //[cite: 1]
                    "Confusion or drowsiness",
                    //[cite: 1]
                    "Symptoms rapidly worsen despite treatment",
                    //[cite: 1]
                  ]
                  .map(
                    (text) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.report_problem,
                            size: 16,
                            color: Colors.red.shade700,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              text,
                              style: TextStyle(
                                color: Colors.red.shade900,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }

  // Elegant helper widget building uniform categories
  Widget _buildSectionCard(
    String title,
    Color accentColor,
    List<BulletItem> itemRules,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xE6FFFFFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Icon(Icons.folder_open_rounded, color: accentColor),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: itemRules
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(item.icon, size: 20, color: accentColor),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item.label,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: Colors.grey.shade800,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletItem {
  final String label;
  final IconData icon;

  BulletItem(this.label, this.icon);
}
