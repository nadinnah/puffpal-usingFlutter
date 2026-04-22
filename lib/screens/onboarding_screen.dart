import 'package:flutter/material.dart';
import 'package:puffpal/views/login_page.dart';
import 'package:puffpal/views/onboarding_page.dart';
import 'package:puffpal/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
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
                            'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                        title: Row(mainAxisAlignment: MainAxisAlignment.center,children:[Text('Welcome to', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,  color: Color(0xFF3D4853) )),SizedBox(width: 10,) , Text('PuffPal', style: GoogleFonts.rubikBubbles(fontSize: 40, fontWeight: FontWeight.w600, color: Color(
                            0xFF1E6097)),)]),
                        description: 'description',
                      ),
                      OnboardingPage(
                        animationUrl:
                            'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                        title: Text('title!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3D4853))),
                        description: 'description',
                      ),
                      OnboardingPage(
                        animationUrl:
                            'https://lottie.host/5cf639ad-7a01-4c6d-94e3-76c986dd6e9c/jFLyI97OUg.json',
                      ),
                    ],
                  ),
                ),
              ),
              if (isLastPage)
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("initScreen", true);
                        Navigator.push(context, _createRoute(LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4781bc),
                        padding: EdgeInsets.symmetric(
                          horizontal: 102,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool("initScreen", true);
                        Navigator.push(context, _createRoute(SignupPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4781bc),
                        padding: EdgeInsets.symmetric(
                          horizontal: 92,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 200.0),
            ]),
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
                            color: Color(0xff556595),
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
                            bottomRight: Radius.circular(2),
                          ),
                          //borderRadius: BorderRadius.circular(16),
                          verticalOffset: 0,
                        ),
                        spacing: 6.0,
                        activeColorOverride: (i) => colors[i],
                        inActiveColorOverride: (i) => colors[i],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
        
        ),
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
