// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get personalInfo => 'Personal Information';

  @override
  String get name => 'Name';

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

  @override
  String get advice_title => 'Advice of the Day';

  @override
  String get advice_inhaler =>
      'Always keep your rescue inhaler with you, even if you feel fine.';

  @override
  String get advice_dust =>
      'Wash your bedding in hot water (60°C) once a week to kill dust mites.';

  @override
  String get advice_cold =>
      'In cold weather, breathe through a scarf to warm the air before it hits your lungs.';

  @override
  String get advice_water =>
      'Drink plenty of water; it helps keep the mucus in your lungs thinner.';

  @override
  String get advice_exercise =>
      'Warm up for 10 minutes before exercising to prevent exercise-induced asthma.';

  @override
  String get advice_pollen =>
      'Keep windows closed during high pollen days or sandstorms.';
}
