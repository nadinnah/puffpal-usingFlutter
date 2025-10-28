import 'package:flutter/material.dart';
import 'package:puffpal/screens/onboarding_screen.dart';
import 'package:puffpal/views/home_page.dart';
import 'package:puffpal/views/login_page.dart';
import 'package:puffpal/views/profile_page.dart';
import 'package:puffpal/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final initScreen = prefs.getBool("initScreen")?? false;

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
        //home: initScreen ? HomePage() : OnboardingScreen());
        home: OnboardingScreen());
  }
}
