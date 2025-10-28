import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String animationUrl;
  final Widget? title;
  final String? description;

  const OnboardingPage({
    super.key,
    required this.animationUrl,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 100),
          Lottie.network(
            animationUrl,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
          if (title != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
              child: title!,
            ),
          if (description != null)
            Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3D4853),
              ),
            ),
        ],
      ),
    );
  }
}
