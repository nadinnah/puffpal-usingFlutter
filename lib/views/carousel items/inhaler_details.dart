import 'package:flutter/material.dart';
import '../../widgets/video_player.dart';

class InhalerDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final List<String> steps;
  final List<String> examples; // Added examples list
  final String video;

  const InhalerDetailsPage({
    super.key,
    required this.title,
    required this.image,
    required this.steps,
    required this.examples, // Initialized here
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
                child: Hero(
                  tag: image,
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

              /// STEPS LIST
              ...List.generate(
                steps.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: const Color(0xff7367f0),
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
              const SizedBox(height: 24),

              /// EXAMPLES SECTION (PLACED BEFORE VIDEO)
              if (examples.isNotEmpty) ...[
                const Text(
                  "Examples",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: examples.map((example) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xff7367f0).withOpacity(0.25)),
                      ),
                      child: Text(
                        example,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2c2c2c),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
              ],

              /// VIDEO PLAYER
              VideoPlayerWidget(
                videoPath: video,
              ),
              SizedBox(height: verticalSpacing / 2),
            ],
          ),
        ),
      ),
    );
  }
}