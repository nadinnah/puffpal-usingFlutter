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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.05;

    final double verticalSpacing = screenHeight * 0.1;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(horizontalPadding, verticalSpacing, horizontalPadding, 0),
        child: Column(
          children: [
            Lottie.network(
              animationUrl,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            if (title != null)
              Padding(
                padding:  EdgeInsets.fromLTRB(0, verticalSpacing, 0, 20),
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
      ),
    );
  }
}
