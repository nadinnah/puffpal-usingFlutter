import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puffpal/l10n/app_localizations.dart';
import 'package:puffpal/views/login_page.dart';
import 'package:puffpal/views/onboarding_page.dart';
import 'package:puffpal/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/language_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double titleSize = screenWidth * 0.08;       // ~28px on standard 400w screens
    final double bodySize = screenWidth * 0.035;
    final double buttonSize = screenWidth * 0.15;
    final double verticalSpacing = screenHeight * 0.1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Padding(
          padding:  EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            'PuffPal',
            style: GoogleFonts.rubikBubbles(
              fontSize: titleSize,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E6097),
            ),
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0, horizontal: buttonSize),
            child: SizedBox(
              width: buttonSize,
              child: DropdownButtonFormField<String>(
                icon: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.language, color: Colors.black),
                  ],
                ),
                style: TextStyle(fontSize: bodySize, color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                initialValue: Localizations.localeOf(context).languageCode,
                items: [
                  const DropdownMenuItem(value: 'en', child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('EN'),
                    ],
                  )),
                  const DropdownMenuItem(value: 'ar', child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('AR'),
                    ],
                  )),
                ],
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    final langController = Provider.of<LanguageController>(
                      context,
                      listen: false,
                    );
                    langController.changeLanguage(newValue);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // 1. Fullscreen Background Gradient Layer
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
                ),
              ),
            ),
          ),

          // 2. Interactive Foreground Layer wrapped in SafeArea
          SafeArea(
            top: false,
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        if (!isLastPage) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            isLastPage = index == 2;
                          });
                        },
                        children: [
                          // PAGE 1 (Centered)
                          Center(
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: OnboardingPage(
                                animationUrl: 'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                                title: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Text(
                                      localizations.welcomeTo,
                                      style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Color(0xFF3D4853)),
                                    ),
                                    Text(
                                      'PuffPal',
                                      style: GoogleFonts.rubikBubbles(fontSize: 32, fontWeight: FontWeight.w600, color: const Color(0xFF1E6097)),
                                    ),
                                  ],
                                ),
                                description: localizations.pocketAsthmaHelper,
                              ),
                            ),
                          ),

                          // PAGE 2 (Centered)
                          Center(
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: OnboardingPage(
                                animationUrl: 'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                                title: Text(
                                  localizations.asthmaCareSimple,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF3D4853)),
                                ),
                                description: localizations.asthmaCareDesc,
                              ),
                            ),
                          ),

                          // PAGE 3 (Kept original alignment so it doesn't clash with the login/signup buttons below it)
                          OnboardingPage(
                            animationUrl: 'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                            title: Text(
                              localizations.onboardingDoneTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D4853)),
                            ),
                            description: localizations.onboardingDoneDesc,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom Section Control Block
                  Column(
                    children: [
                      if (isLastPage) ...[
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("initScreen", true);
                            if (!mounted) return;
                            Navigator.push(context, _createRoute(const LoginPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4781bc),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 102,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            localizations.loginButton,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setBool("initScreen", true);
                            if (!mounted) return;
                            Navigator.push(context, _createRoute(const SignupPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff4781bc),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 92,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            localizations.signupButton,
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        SizedBox(height: verticalSpacing * 0.5),
                      ],
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
                            dotBorder: const DotBorder(
                              padding: 2,
                              width: 2,
                              color: Color(0xff556595),
                            ),
                          ),
                          dotDecoration: DotDecoration(
                            width: 24,
                            height: 12,
                            color: Colors.grey,
                            dotBorder: const DotBorder(
                              padding: 2,
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(2),
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(2),
                            ),
                            verticalOffset: 0,
                          ),
                          spacing: 6.0,
                          activeColorOverride: (i) => colors[i],
                          inActiveColorOverride: (i) => colors[i],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final colors = const [
  Color(0xff1E3A8A),
  Color(0xff06B6D4),
  Color(0xffaad4f8),
  Color(0xff374151),
];

Route<void> _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}