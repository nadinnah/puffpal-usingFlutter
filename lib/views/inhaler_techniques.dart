import 'package:flutter/material.dart';

import 'inhaler_details.dart';

class InhalerTechniquesPage extends StatelessWidget {
  const InhalerTechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Inhaler Techniques", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),

            inhalerButton(
              context,
              title: "MDI Inhaler",
              type: "Inhaler",
              image: "assets/images/mdi.jpg",
              steps: [
                "Shake inhaler",
                "Breathe out fully",
                "Press inhaler once",
                "Inhale slowly",
              ],
              video: 'assets/videos/mdi.mp4',
            ),

            const SizedBox(height: 16),

            inhalerButton(
              context,
              title: "Spacer",
              type: "Inhaler",
              image: "assets/images/spacer.jpg",
              steps: [
                "Attach inhaler to spacer",
                "Press inhaler once",
                "Breathe slowly",
              ],
              video: 'assets/videos/spacer.mp4',
            ),

            const SizedBox(height: 16),

            inhalerButton(
              context,
              title: "Nebulizer",
              type: "Inhaler",
              image: "assets/images/nebulizer.jpg",
              steps: ["Add medication", "Turn machine on", "Breathe normally"],
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
