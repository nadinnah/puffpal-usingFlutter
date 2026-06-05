import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/onboarding_screen.dart';
import '../views/common/app_shell.dart';
import '../views/login_page.dart';
import '../views/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _handleAppRouting();
  }

  Future<void> _handleAppRouting() async {
    // Keep splash screen visible for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // 1. Check if they have finished the onboarding process
    final bool initScreen = prefs.getBool("initScreen") ?? false;

    // 2. Check if they are currently logged into an account
    final bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

    // Routing Decision Tree
    if (!initScreen) {
      // First time ever opening the app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else if (isLoggedIn) {
      // Onboarding complete AND logged in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AppShell()),
      );
    } else {
      // Onboarding complete BUT not logged in yet
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd8d6ea),
      body: Center(
        child: Image.asset(
          'assets/images/app_icon.png',
        ),
      ),
    );
  }
}