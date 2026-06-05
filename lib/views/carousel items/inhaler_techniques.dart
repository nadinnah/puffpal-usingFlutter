import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart'; // Ensure this matches your localization path
import 'inhaler_details.dart';

class InhalerTechniquesPage extends StatelessWidget {
  const InhalerTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double verticalSpacing = screenHeight * 0.12;

    return Scaffold(
      backgroundColor: const Color(0xffd8d6ea),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.inhalerPageHeaderDesc,
              style: const TextStyle(color: Colors.black54, fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 24),

            _buildInhalerCard(
              context,
              title: localizations.mdiTitle,
              subtitle: localizations.mdiSubtitle,
              image: "assets/images/mdi.png",
              steps: [
                localizations.mdiStep1,
                localizations.mdiStep2,
                localizations.mdiStep3,
                localizations.mdiStep4,
                localizations.mdiStep5,
                localizations.mdiStep6,
                localizations.mdiStep7,
              ],
              video: 'assets/videos/mdi.mp4',
            ),

            _buildInhalerCard(
              context,
              title: localizations.spacerTitle,
              subtitle: localizations.spacerSubtitle,
              image: "assets/images/spacer.png",
              steps: [
                localizations.spacerStep1,
                localizations.spacerStep2,
                localizations.spacerStep3,
                localizations.spacerStep4,
                localizations.spacerStep5,
                localizations.spacerStep6,
                localizations.spacerStep7,
              ],
              video: 'assets/videos/spacer.mp4',
            ),

            _buildInhalerCard(
              context,
              title: localizations.nebulizerTitle,
              subtitle: localizations.nebulizerSubtitle,
              image: "assets/images/nebulizer.png",
              steps: [
                localizations.nebulizerStep1,
                localizations.nebulizerStep2,
                localizations.nebulizerStep3,
                localizations.nebulizerStep4,
                localizations.nebulizerStep5,
                localizations.nebulizerStep6,
              ],
              video: 'assets/videos/nebulizer.mp4',
            ),
            SizedBox(height: verticalSpacing / 2),
          ],
        ),
      ),
    );
  }

  Widget _buildInhalerCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String image,
        required List<String> steps,
        required String video,
      }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InhalerDetailsPage(
                    title: title,
                    image: image,
                    steps: steps,
                    video: video,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f2fa),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Hero(
                        tag: image,
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.medical_services, color: Color(0xff7367f0), size: 30);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2c2c2c),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xfff3f2fa),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}