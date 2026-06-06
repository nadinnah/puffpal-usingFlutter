import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
import 'package:puffpal/controllers/language_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:puffpal/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF1E6097));

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await AndroidAlarmManager.initialize();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAnalytics.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool initScreen = prefs.getBool("initScreen") ?? false;
  final bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  final languageController = LanguageController();

  await FirebaseApi().initNotification();
  final notificationService = LocalNotificationService();
  await notificationService.init();
  await notificationService.requestPermissions();

  final Widget startingView = _determineInitialView(initScreen: initScreen, isLoggedIn: isLoggedIn);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((fn) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: languageController),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: App(startingView: startingView),
      ),
    );
  });
}

Widget _determineInitialView({required bool initScreen, required bool isLoggedIn}) {

  FlutterNativeSplash.remove();

  if (!initScreen) {
    return const OnboardingScreen();
  } else if (isLoggedIn) {
    return const AppShell();
  } else {
    return const LoginPage();
  }
}

class App extends StatelessWidget {
  final Widget startingView;

  const App({super.key, required this.startingView});

  @override
  Widget build(BuildContext context) {
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
      home: startingView,
    );
  }
}