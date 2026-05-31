import 'package:flutter/material.dart';

import 'inhaler_details.dart';

class InhalerTechniquesPage extends StatelessWidget {
  const InhalerTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              const SizedBox(height: 20),

              inhalerButton(
                context,
                title: "MDI Inhaler",
                type: "Inhaler",
                image: "assets/images/mdi.jpg",
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

              const SizedBox(height: 16),

              inhalerButton(
                context,
                title: "MDI with Spacer",
                type: "Inhaler",
                image: "assets/images/spacer.jpg",
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

              const SizedBox(height: 16),

              inhalerButton(
                context,
                title: "Nebulizer",
                type: "Inhaler",
                image: "assets/images/nebulizer.jpg",
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
            ],
          ),
        ),
    );
  }

  Widget inhalerButton(
    BuildContext context, {
    required String title,
    required String type,
    required String image,
    required List<String> steps,
    required String video,
  }) {
    return SizedBox(
      width: double.infinity,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),

        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (_) => InhalerDetailsPage(
                title: title,
                image: image,
                steps: steps,
                video: '',
              ),
            ),
          );
        },

        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
