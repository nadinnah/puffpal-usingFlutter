import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:puffpal/screens/onboarding_screen.dart';
import 'package:puffpal/services/firebase_api.dart';
import 'package:puffpal/services/local_notification_service.dart';
import 'package:puffpal/services/user_provider.dart';
import 'package:puffpal/views/common/app_shell.dart';
import 'package:puffpal/views/home_page.dart';
import 'package:puffpal/views/login_page.dart';
import 'package:puffpal/views/profile_page.dart';
import 'package:puffpal/views/quizzes_games_page.dart';
import 'package:puffpal/views/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/language_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:puffpal/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color(0xFF1E6097));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final initScreen = prefs.getBool("initScreen") ?? false;
  final notificationsEnabled = prefs.getBool("notificationsEnabled") ?? false;

  await FirebaseApi().initNotification();
  final notificationService = LocalNotificationService();
  await notificationService.init();
  await notificationService.requestPermissions();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LanguageController()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: App(initScreen: initScreen),
      ),
    );
  });
}

class App extends StatelessWidget {
  final bool initScreen;

  const App({super.key, required this.initScreen});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final languageController = context.watch<LanguageController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PuffPal',
      locale: languageController.locale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/quizzes': (context) => QuizzesGamesPage(),
        '/appshell': (context) => AppShell(),
        '/onboarding': (context) => OnboardingScreen(),
      },
      //home: initScreen ? LoginPage() : OnboardingScreen());
      home: initScreen ? AppShell() : OnboardingScreen(),
    );
    //home: OnboardingScreen());
    //home: initScreen ? const AppShell() : const OnboardingScreen(),
  }
}
