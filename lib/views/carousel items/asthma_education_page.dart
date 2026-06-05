import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../models/carousel.dart';

class AsthmaEducationPage extends StatelessWidget {
  final EducationMode mode;

  const AsthmaEducationPage({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                          ? localizations.eduTriggersHeaderDesc
                          : localizations.eduReferralHeaderDesc,
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
            isTriggers ? _buildTriggersList(localizations) : _buildReferralList(localizations),
            SizedBox(height: verticalSpacing / 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTriggersList(AppLocalizations localizations) {
    return Column(
      children: [
        _buildSectionCard(localizations.eduSecAirborneIrritants, Colors.blue, [
          BulletItem(localizations.eduTriggerSmoke, Icons.smoke_free),
          BulletItem(localizations.eduTriggerAllergens, Icons.grass),
          BulletItem(localizations.eduTriggerChemicals, Icons.clean_hands),
        ]),
        _buildSectionCard(localizations.eduSecHomeEnv, Colors.green, [
          BulletItem(localizations.eduTriggerVentilation, Icons.window),
          BulletItem(localizations.eduTriggerBedCovers, Icons.bed),
          BulletItem(localizations.eduTriggerColdAir, Icons.ac_unit),
        ]),
        _buildSectionCard(localizations.eduSecMedicalLifestyle, Colors.orange, [
          BulletItem(localizations.eduTriggerInfections, Icons.wash),
          BulletItem(localizations.eduTriggerExercise, Icons.fitness_center),
          BulletItem(localizations.eduTriggerMeds, Icons.medication),
          BulletItem(localizations.eduTriggerStress, Icons.psychology),
        ]),
      ],
    );
  }

  Widget _buildReferralList(AppLocalizations localizations) {
    return Column(
      children: [
        _buildSectionCard(localizations.eduSecConsultDoctor, Colors.orange.shade800, [
          BulletItem(localizations.eduRefSevereSymptoms, Icons.trending_up),
          BulletItem(localizations.eduRefRescueInhalerUsage, Icons.replay),
          BulletItem(localizations.eduRefNightAwakening, Icons.bedtime),
          BulletItem(localizations.eduRefDiffBreathingWalking, Icons.directions_walk),
          BulletItem(localizations.eduRefLowPeakFlow, Icons.speed),
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
                    localizations.eduEmergencyTitle,
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
                localizations.eduEmergShortnessBreath,
                localizations.eduEmergSilentChest,
                localizations.eduEmergBlueLipsNails,
                localizations.eduEmergDrowsiness,
                localizations.eduEmergWorseningStatus,
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

  Widget _buildSectionCard(
      String title,
      Color accentColor,
      List<BulletItem> itemRules,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xE6FFFFFF),
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