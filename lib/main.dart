import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:puffpal/screens/onboarding_screen.dart';
import 'package:puffpal/services/firebase_api.dart';
import 'package:puffpal/services/local_notification_service.dart';
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

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final initScreen = prefs.getBool("initScreen")?? false;

  await AndroidAlarmManager.initialize();

  await FirebaseApi().initNotification();
  await LocalNotificationService().init();

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
          '/appshell': (context) => AppShell(),
          '/onboarding': (context) => OnboardingScreen()
        },
        //home: initScreen ? LoginPage() : OnboardingScreen());
        home: initScreen ? AppShell() : OnboardingScreen());
        //home: OnboardingScreen());
  }
}
