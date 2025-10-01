import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final String animationUrl;
  final String title;
  final String description;

  const OnboardingPage(
      {super.key,
        required this.title,
        required this.animationUrl,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.network(animationUrl, height: 300),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey[800])),
        Text(description,textAlign: TextAlign.center,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}
