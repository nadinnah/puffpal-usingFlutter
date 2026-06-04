import 'package:flutter/material.dart';
import '../../widgets/video_player.dart';

class InhalerDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final List<String> steps;
  final String video;

  const InhalerDetailsPage({
    super.key,
    required this.title,
    required this.image,
    required this.steps,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double horizontalPadding = screenWidth * 0.05;
    final double verticalSpacing = screenHeight * 0.12;

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFD8D0E5),
              Color(0xFFD9DBEF),
              Color(0xFFA8ABCA),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Clean up app bar look
            iconTheme: const IconThemeData(color: Colors.black), // Ensures back button is visible
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// IMAGE WITH HERO FLIGHT TRANSITION
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  // ADDED: Hero widget wrapping the destination image
                  child: Hero(
                    tag: image, // Matches the exact tag from the list card
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// STEPS TITLE
                const Text(
                  "Steps",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                /// STEPS
                ...List.generate(
                  steps.length,
                      (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: const Color(0xff7367f0), // Given a nice primary pop color
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(
                            steps[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                VideoPlayerWidget(
                  videoPath: video,
                ),
                SizedBox(height: verticalSpacing/2),
              ],
            ),
          ),
        ));
  }
}