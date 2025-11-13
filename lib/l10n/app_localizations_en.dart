// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PuffPal';

  @override
  String get name =>'Name';

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone Number';

  @override
  String get gender => 'Gender';

  @override
  String get age => 'Age';

  @override
  String hello(Object userName) {
    return 'Hello $userName!';
  }

  @override
  String get discoverText =>
      'Discover how understanding your health can make every breath easier!';

  @override
  String get trackSymptoms => 'Track Your Symptoms!';

  @override
  String get quickQuestions => 'Quick questions';

  @override
  String get breatheBetter => 'Breathe Better, learn More';

  @override
  String get quizzesTitle => 'Quizzes and Games';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get medicationReminders => 'Medication Reminders';
}
