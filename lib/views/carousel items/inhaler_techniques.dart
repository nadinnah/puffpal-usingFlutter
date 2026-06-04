import 'package:flutter/material.dart';
import 'inhaler_details.dart';

class InhalerTechniquesPage extends StatelessWidget {
  const InhalerTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.05;

    final double verticalSpacing = screenHeight * 0.12;
    return Scaffold(
      // Changed transparent to the light aesthetic lavender/blue background from your previous screens
      backgroundColor: const Color(0xffd8d6ea),

      // Wrapped in a SingleChildScrollView to safely prevent screen overflows
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your device type to review the correct step-by-step administration methods.",
              style: TextStyle(color: Colors.black54, fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 24),

            _buildInhalerCard(
              context,
              title: "MDI Inhaler",
              subtitle: "Metered Dose Inhaler",
              image: "assets/images/mdi.png",
              steps: [
                "Shake the inhaler.",
                "Breathe out fully.",
                "Place mouthpiece in your mouth and seal lips around it.",
                "Press once and breathe in slowly and deeply.",
                "Hold your breath for 10 seconds.",
                "Breathe out slowly.",
                "Wait 30–60 seconds before a second puff if prescribed.",
              ],
              video: 'assets/videos/mdi.mp4',
            ),

            _buildInhalerCard(
              context,
              title: "MDI with Spacer",
              subtitle: "Inhaler with holding chamber",
              image: "assets/images/spacer.png",
              steps: [
                "Shake inhaler and attach it to the spacer.",
                "Breathe out fully.",
                "Place spacer mouthpiece in your mouth.",
                "Press the inhaler once into the spacer.",
                "Take a slow deep breath in or 4–5 normal breaths.",
                "Hold your breath for 10 seconds if possible.",
                "Repeat if another puff is needed.",
              ],
              video: 'assets/videos/spacer.mp4',
            ),

            _buildInhalerCard(
              context,
              title: "Nebulizer",
              subtitle: "Liquid mist delivery machine",
              image: "assets/images/nebulizer.png",
              steps: [
                "Wash your hands.",
                "Put the medicine into the nebulizer cup.",
                "Attach the mask or mouthpiece.",
                "Turn on the machine.",
                "Breathe normally through the mouth until the mist stops (about 10–15 minutes).",
                "Turn off the machine and clean the equipment after use.",
              ],
              video: 'assets/videos/nebulizer.mp4',
            ),
             SizedBox(height: verticalSpacing/2),
          ],
        ),
      ),
    );
  }

  // Modern UI Card Builder Component
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
                  // Visual Thumbnail Frame
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f2fa),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      // ADDED: Hero widget wrapping the source image
                      child: Hero(
                        tag: image, // Using the image path as a unique tag
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill ,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.medical_services, color: Color(0xff7367f0), size: 30);
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Text Descriptions Column
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

                  // Action Chevron Indicator
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xfff3f2fa),
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
  }}