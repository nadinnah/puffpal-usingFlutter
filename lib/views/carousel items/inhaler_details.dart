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

    return Container(
        decoration: BoxDecoration(
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
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Image.asset(
                image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            /// STEPS TITLE
            const Text(
              "Steps",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                      child: Text("${index + 1}"),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Text(
                        steps[index],

                        style: const TextStyle(
                          fontSize: 16,
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
          ],
        ),
      ),
      ));
  }
}