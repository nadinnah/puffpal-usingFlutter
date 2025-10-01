import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 2;
                  });
                },
                children: [
                  OnboardingPage(
                      animationUrl:
                      'https://lottie.host/786170f4-55ee-46ce-9231-df87f8447c78/sEXoNCHnLX.json',
                      title: 'Welcome to MoveEasy',
                      description: 'Moving Made Easy, All In One App'),
                  OnboardingPage(
                      animationUrl:
                      'https://lottie.host/786170f4-55ee-46ce-9231-df87f8447c78/sEXoNCHnLX.json',
                      title: 'Stress-free moving',
                      description: 'Moving Made Easy, All In One App'),
                  OnboardingPage(
                      animationUrl:
                      'https://lottie.host/786170f4-55ee-46ce-9231-df87f8447c78/sEXoNCHnLX.json',
                      title: 'Find your next home',
                      description: 'Moving Made Easy, All In One App'),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 32,
                  height: 12,
                  color: Colors.indigo,
                  rotationAngle: 180,
                  verticalOffset: -10,
                  borderRadius: BorderRadius.circular(24),
                  dotBorder: DotBorder(
                    padding: 2,
                    width: 2,
                    color: Colors.indigo,
                  ),
                ),
                dotDecoration: DotDecoration(
                  width: 24,
                  height: 12,
                  color: Colors.grey,
                  dotBorder: DotBorder(
                    padding: 2,
                    width: 2,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(2)),
                  //borderRadius: BorderRadius.circular(16),
                  verticalOffset: 0,
                ),
                spacing: 6.0,
                activeColorOverride: (i) => colors[i],
                inActiveColorOverride: (i) => colors[i],
              ),
            ),
            const SizedBox(height: 32.0),
            isLastPage
                ? ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding:
                  EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text('Get Started'))
                : TextButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
