import 'package:flutter/material.dart';
import 'package:puffpal/screens/onboarding_screen.dart';
import 'package:puffpal/views/common/app_shell.dart';
import 'package:puffpal/views/home_page.dart';
import 'package:puffpal/views/login_page.dart';
import 'package:puffpal/views/profile_page.dart';
import 'package:puffpal/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final initScreen = prefs.getBool("initScreen")?? false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(App(initScreen: initScreen));
}

class App extends StatelessWidget {
  final bool initScreen;
  const App({super.key, required this.initScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PuffPal',
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
          '/onboarding': (context) => OnboardingScreen()
        },
        //home: initScreen ? LoginPage() : OnboardingScreen());
        home: initScreen ? AppShell() : OnboardingScreen());
        //home: OnboardingScreen());
  }
}
