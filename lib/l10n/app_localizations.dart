import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfo;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello {userName}!'**
  String hello(Object userName);

  /// No description provided for @discoverText.
  ///
  /// In en, this message translates to:
  /// **'Discover how understanding your health can make every breath easier!'**
  String get discoverText;

  /// No description provided for @trackSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Track Your Symptoms!'**
  String get trackSymptoms;

  /// No description provided for @quickQuestions.
  ///
  /// In en, this message translates to:
  /// **'Quick questions'**
  String get quickQuestions;

  /// No description provided for @logitLearnItControlIt.
  ///
  /// In en, this message translates to:
  /// **'Log it, Learn it, Control it'**
  String get logitLearnItControlIt;

  /// No description provided for @breatheBetter.
  ///
  /// In en, this message translates to:
  /// **'Breathe Better, learn More'**
  String get breatheBetter;

  /// No description provided for @quizzesTitle.
  ///
  /// In en, this message translates to:
  /// **'Quizzes and Games'**
  String get quizzesTitle;

  /// No description provided for @setReminder.
  ///
  /// In en, this message translates to:
  /// **'Set Reminder'**
  String get setReminder;

  /// No description provided for @medicationReminders.
  ///
  /// In en, this message translates to:
  /// **'Medication Reminders'**
  String get medicationReminders;

  /// No description provided for @advice_title.
  ///
  /// In en, this message translates to:
  /// **'Advice of the Day!'**
  String get advice_title;

  /// No description provided for @asthmaBasicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Asthma Basics'**
  String get asthmaBasicsTitle;

  /// No description provided for @understandingAsthma.
  ///
  /// In en, this message translates to:
  /// **'Understanding Asthma'**
  String get understandingAsthma;

  /// No description provided for @asthmaHeaderDescription.
  ///
  /// In en, this message translates to:
  /// **'Think of your airways as roads. Asthma causes traffic jams by making them swollen, narrow, and filled with mucus.'**
  String get asthmaHeaderDescription;

  /// No description provided for @asthmaBasicsSection.
  ///
  /// In en, this message translates to:
  /// **'Asthma Basics'**
  String get asthmaBasicsSection;

  /// No description provided for @asthmaFact1.
  ///
  /// In en, this message translates to:
  /// **'Asthma is a chronic condition.'**
  String get asthmaFact1;

  /// No description provided for @asthmaFact2.
  ///
  /// In en, this message translates to:
  /// **'You live with it every day.'**
  String get asthmaFact2;

  /// No description provided for @asthmaFact3.
  ///
  /// In en, this message translates to:
  /// **'It can be serious and even life-threatening.'**
  String get asthmaFact3;

  /// No description provided for @asthmaFact4.
  ///
  /// In en, this message translates to:
  /// **'There is no cure, but it can be managed successfully.'**
  String get asthmaFact4;

  /// No description provided for @whatHappensTitle.
  ///
  /// In en, this message translates to:
  /// **'What Happens During Asthma?'**
  String get whatHappensTitle;

  /// No description provided for @airwaySwollen.
  ///
  /// In en, this message translates to:
  /// **'Airways become swollen'**
  String get airwaySwollen;

  /// No description provided for @musclesTighten.
  ///
  /// In en, this message translates to:
  /// **'Muscles tighten around them'**
  String get musclesTighten;

  /// No description provided for @moreMucus.
  ///
  /// In en, this message translates to:
  /// **'More mucus forms'**
  String get moreMucus;

  /// No description provided for @airwaysNarrow.
  ///
  /// In en, this message translates to:
  /// **'Airways become narrow'**
  String get airwaysNarrow;

  /// No description provided for @commonSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Common Symptoms'**
  String get commonSymptoms;

  /// No description provided for @cough.
  ///
  /// In en, this message translates to:
  /// **'Cough'**
  String get cough;

  /// No description provided for @wheezing.
  ///
  /// In en, this message translates to:
  /// **'Wheezing'**
  String get wheezing;

  /// No description provided for @chestTightness.
  ///
  /// In en, this message translates to:
  /// **'Chest Tightness'**
  String get chestTightness;

  /// No description provided for @shortnessBreath.
  ///
  /// In en, this message translates to:
  /// **'Shortness of Breath'**
  String get shortnessBreath;

  /// No description provided for @typesOfAsthma.
  ///
  /// In en, this message translates to:
  /// **'Types of Asthma'**
  String get typesOfAsthma;

  /// No description provided for @viewAsthmaTypes.
  ///
  /// In en, this message translates to:
  /// **'View Asthma Types'**
  String get viewAsthmaTypes;

  /// No description provided for @allergicAsthma.
  ///
  /// In en, this message translates to:
  /// **'Allergic Asthma'**
  String get allergicAsthma;

  /// No description provided for @aspirinAsthma.
  ///
  /// In en, this message translates to:
  /// **'Aspirin-Induced Asthma'**
  String get aspirinAsthma;

  /// No description provided for @coughVariantAsthma.
  ///
  /// In en, this message translates to:
  /// **'Cough-Variant Asthma'**
  String get coughVariantAsthma;

  /// No description provided for @exerciseAsthma.
  ///
  /// In en, this message translates to:
  /// **'Exercise-Induced Asthma'**
  String get exerciseAsthma;

  /// No description provided for @nighttimeAsthma.
  ///
  /// In en, this message translates to:
  /// **'Nighttime Asthma'**
  String get nighttimeAsthma;

  /// No description provided for @steroidAsthma.
  ///
  /// In en, this message translates to:
  /// **'Steroid-Resistant Asthma'**
  String get steroidAsthma;

  /// No description provided for @occupationalAsthma.
  ///
  /// In en, this message translates to:
  /// **'Occupational Asthma'**
  String get occupationalAsthma;

  /// No description provided for @dailyManagementTips.
  ///
  /// In en, this message translates to:
  /// **'Daily Management Tips'**
  String get dailyManagementTips;

  /// No description provided for @tip1.
  ///
  /// In en, this message translates to:
  /// **'Take medications exactly as prescribed'**
  String get tip1;

  /// No description provided for @tip2.
  ///
  /// In en, this message translates to:
  /// **'Carry your rescue inhaler'**
  String get tip2;

  /// No description provided for @tip3.
  ///
  /// In en, this message translates to:
  /// **'Avoid smoke, dust, and pollution'**
  String get tip3;

  /// No description provided for @tip4.
  ///
  /// In en, this message translates to:
  /// **'Keep your home clean and well ventilated'**
  String get tip4;

  /// No description provided for @tip5.
  ///
  /// In en, this message translates to:
  /// **'Wash bedding regularly'**
  String get tip5;

  /// No description provided for @tip6.
  ///
  /// In en, this message translates to:
  /// **'Stay active with approved exercise'**
  String get tip6;

  /// No description provided for @tip7.
  ///
  /// In en, this message translates to:
  /// **'Warm up before exercise'**
  String get tip7;

  /// No description provided for @tip8.
  ///
  /// In en, this message translates to:
  /// **'Drink enough water'**
  String get tip8;

  /// No description provided for @tip9.
  ///
  /// In en, this message translates to:
  /// **'Manage stress'**
  String get tip9;

  /// No description provided for @tip10.
  ///
  /// In en, this message translates to:
  /// **'Get enough sleep'**
  String get tip10;

  /// No description provided for @tip11.
  ///
  /// In en, this message translates to:
  /// **'Avoid smoking and secondhand smoke'**
  String get tip11;

  /// No description provided for @tip12.
  ///
  /// In en, this message translates to:
  /// **'Get recommended vaccines'**
  String get tip12;

  /// No description provided for @tip13.
  ///
  /// In en, this message translates to:
  /// **'Monitor symptoms'**
  String get tip13;

  /// No description provided for @tip14.
  ///
  /// In en, this message translates to:
  /// **'Follow your asthma action plan'**
  String get tip14;

  /// No description provided for @knowYourInhalers.
  ///
  /// In en, this message translates to:
  /// **'Know Your Inhalers'**
  String get knowYourInhalers;

  /// No description provided for @reliever.
  ///
  /// In en, this message translates to:
  /// **'Reliever'**
  String get reliever;

  /// No description provided for @relieverDescription.
  ///
  /// In en, this message translates to:
  /// **'Works fast during symptoms or before exercise.'**
  String get relieverDescription;

  /// No description provided for @controller.
  ///
  /// In en, this message translates to:
  /// **'Controller'**
  String get controller;

  /// No description provided for @controllerDescription.
  ///
  /// In en, this message translates to:
  /// **'Used every day to prevent attacks.'**
  String get controllerDescription;

  /// No description provided for @quickReminder.
  ///
  /// In en, this message translates to:
  /// **'Quick Reminder'**
  String get quickReminder;

  /// No description provided for @reminderText.
  ///
  /// In en, this message translates to:
  /// **'Feeling well? Take your Controller as prescribed.\n\nStarting to cough, wheeze, or feel tight-chested?\nUse your Reliever and follow your asthma action plan.'**
  String get reminderText;

  /// No description provided for @quizCompleted.
  ///
  /// In en, this message translates to:
  /// **'Quiz Completed!'**
  String get quizCompleted;

  /// No description provided for @scoreMessage.
  ///
  /// In en, this message translates to:
  /// **'Your score is {score} out of {total}'**
  String scoreMessage(int score, int total);

  /// No description provided for @quiz1Title.
  ///
  /// In en, this message translates to:
  /// **'Asthma Basics Adventure'**
  String get quiz1Title;

  /// No description provided for @q1_1.
  ///
  /// In en, this message translates to:
  /// **'Asthma affects which part of the body?'**
  String get q1_1;

  /// No description provided for @q1_1_a.
  ///
  /// In en, this message translates to:
  /// **'Airways'**
  String get q1_1_a;

  /// No description provided for @q1_1_b.
  ///
  /// In en, this message translates to:
  /// **'Stomach'**
  String get q1_1_b;

  /// No description provided for @q1_1_c.
  ///
  /// In en, this message translates to:
  /// **'Bones'**
  String get q1_1_c;

  /// No description provided for @q1_1_d.
  ///
  /// In en, this message translates to:
  /// **'Skin'**
  String get q1_1_d;

  /// No description provided for @q1_2.
  ///
  /// In en, this message translates to:
  /// **'In the “traffic jam” example, what causes the roads (airways) to become crowded?'**
  String get q1_2;

  /// No description provided for @q1_2_a.
  ///
  /// In en, this message translates to:
  /// **'Mucus and swelling'**
  String get q1_2_a;

  /// No description provided for @q1_2_b.
  ///
  /// In en, this message translates to:
  /// **'Extra oxygen'**
  String get q1_2_b;

  /// No description provided for @q1_2_c.
  ///
  /// In en, this message translates to:
  /// **'More blood flow'**
  String get q1_2_c;

  /// No description provided for @q1_2_d.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get q1_2_d;

  /// No description provided for @q1_3.
  ///
  /// In en, this message translates to:
  /// **'Asthma is described as:'**
  String get q1_3;

  /// No description provided for @q1_3_a.
  ///
  /// In en, this message translates to:
  /// **'A chronic condition'**
  String get q1_3_a;

  /// No description provided for @q1_3_b.
  ///
  /// In en, this message translates to:
  /// **'A short-term illness'**
  String get q1_3_b;

  /// No description provided for @q1_3_c.
  ///
  /// In en, this message translates to:
  /// **'A broken bone'**
  String get q1_3_c;

  /// No description provided for @q1_3_d.
  ///
  /// In en, this message translates to:
  /// **'An infection'**
  String get q1_3_d;

  /// No description provided for @q1_4.
  ///
  /// In en, this message translates to:
  /// **'Which statement about asthma is TRUE?'**
  String get q1_4;

  /// No description provided for @q1_4_a.
  ///
  /// In en, this message translates to:
  /// **'There is no cure, but it can be controlled'**
  String get q1_4_a;

  /// No description provided for @q1_4_b.
  ///
  /// In en, this message translates to:
  /// **'It always goes away on its own'**
  String get q1_4_b;

  /// No description provided for @q1_4_b2.
  ///
  /// In en, this message translates to:
  /// **'It cannot be managed'**
  String get q1_4_b2;

  /// No description provided for @q1_4_c.
  ///
  /// In en, this message translates to:
  /// **'Only children get asthma'**
  String get q1_4_c;

  /// No description provided for @q1_5.
  ///
  /// In en, this message translates to:
  /// **'What happens to the muscles around the airways during an asthma flare?'**
  String get q1_5;

  /// No description provided for @q1_5_a.
  ///
  /// In en, this message translates to:
  /// **'They tighten'**
  String get q1_5_a;

  /// No description provided for @q1_5_b.
  ///
  /// In en, this message translates to:
  /// **'They relax completely'**
  String get q1_5_b;

  /// No description provided for @q1_5_c.
  ///
  /// In en, this message translates to:
  /// **'They disappear'**
  String get q1_5_c;

  /// No description provided for @q1_5_d.
  ///
  /// In en, this message translates to:
  /// **'They grow larger'**
  String get q1_5_d;

  /// No description provided for @q1_6.
  ///
  /// In en, this message translates to:
  /// **'Which of these is NOT a common asthma symptom?'**
  String get q1_6;

  /// No description provided for @q1_6_a.
  ///
  /// In en, this message translates to:
  /// **'Toothache'**
  String get q1_6_a;

  /// No description provided for @q1_6_b.
  ///
  /// In en, this message translates to:
  /// **'Wheezing'**
  String get q1_6_b;

  /// No description provided for @q1_6_c.
  ///
  /// In en, this message translates to:
  /// **'Chest tightness'**
  String get q1_6_c;

  /// No description provided for @q1_6_d.
  ///
  /// In en, this message translates to:
  /// **'Shortness of breath'**
  String get q1_6_d;

  /// No description provided for @q1_7.
  ///
  /// In en, this message translates to:
  /// **'What happens to the airways during asthma?'**
  String get q1_7;

  /// No description provided for @q1_7_a.
  ///
  /// In en, this message translates to:
  /// **'They become narrower'**
  String get q1_7_a;

  /// No description provided for @q1_7_b.
  ///
  /// In en, this message translates to:
  /// **'They become wider'**
  String get q1_7_b;

  /// No description provided for @q1_7_c.
  ///
  /// In en, this message translates to:
  /// **'They turn blue'**
  String get q1_7_c;

  /// No description provided for @q1_7_d.
  ///
  /// In en, this message translates to:
  /// **'They stop working forever'**
  String get q1_7_d;

  /// No description provided for @q1_8.
  ///
  /// In en, this message translates to:
  /// **'Which of the following can happen during asthma?'**
  String get q1_8;

  /// No description provided for @q1_8_a.
  ///
  /// In en, this message translates to:
  /// **'More mucus forms'**
  String get q1_8_a;

  /// No description provided for @q1_8_b.
  ///
  /// In en, this message translates to:
  /// **'Hair grows faster'**
  String get q1_8_b;

  /// No description provided for @q1_8_c.
  ///
  /// In en, this message translates to:
  /// **'Vision improves'**
  String get q1_8_c;

  /// No description provided for @q1_8_d.
  ///
  /// In en, this message translates to:
  /// **'Bones weaken'**
  String get q1_8_d;

  /// No description provided for @q1_9.
  ///
  /// In en, this message translates to:
  /// **'Which symptom may make breathing feel harder?'**
  String get q1_9;

  /// No description provided for @q1_9_a.
  ///
  /// In en, this message translates to:
  /// **'All of the above'**
  String get q1_9_a;

  /// No description provided for @q1_9_b.
  ///
  /// In en, this message translates to:
  /// **'Wheezing'**
  String get q1_9_b;

  /// No description provided for @q1_9_c.
  ///
  /// In en, this message translates to:
  /// **'Shortness of breath'**
  String get q1_9_c;

  /// No description provided for @q1_9_d.
  ///
  /// In en, this message translates to:
  /// **'Chest tightness'**
  String get q1_9_d;

  /// No description provided for @q1_10.
  ///
  /// In en, this message translates to:
  /// **'Asthma can be:'**
  String get q1_10;

  /// No description provided for @q1_10_a.
  ///
  /// In en, this message translates to:
  /// **'Serious and life-threatening'**
  String get q1_10_a;

  /// No description provided for @q1_10_b.
  ///
  /// In en, this message translates to:
  /// **'Always harmless'**
  String get q1_10_b;

  /// No description provided for @q1_10_c.
  ///
  /// In en, this message translates to:
  /// **'Contagious'**
  String get q1_10_c;

  /// No description provided for @q1_10_d.
  ///
  /// In en, this message translates to:
  /// **'Caused by eating candy'**
  String get q1_10_d;

  /// No description provided for @quiz2Title.
  ///
  /// In en, this message translates to:
  /// **'Asthma Hero Challenge'**
  String get quiz2Title;

  /// No description provided for @q2_1.
  ///
  /// In en, this message translates to:
  /// **'Which asthma type may happen during or after physical activity?'**
  String get q2_1;

  /// No description provided for @q2_1_a.
  ///
  /// In en, this message translates to:
  /// **'Exercise-induced asthma'**
  String get q2_1_a;

  /// No description provided for @q2_1_b.
  ///
  /// In en, this message translates to:
  /// **'Nighttime asthma'**
  String get q2_1_b;

  /// No description provided for @q2_1_c.
  ///
  /// In en, this message translates to:
  /// **'Occupational asthma'**
  String get q2_1_c;

  /// No description provided for @q2_1_d.
  ///
  /// In en, this message translates to:
  /// **'Allergic asthma'**
  String get q2_1_d;

  /// No description provided for @q2_2.
  ///
  /// In en, this message translates to:
  /// **'What should you always carry with you?'**
  String get q2_2;

  /// No description provided for @q2_2_a.
  ///
  /// In en, this message translates to:
  /// **'Rescue inhaler'**
  String get q2_2_a;

  /// No description provided for @q2_2_b.
  ///
  /// In en, this message translates to:
  /// **'Sunglasses'**
  String get q2_2_b;

  /// No description provided for @q2_2_c.
  ///
  /// In en, this message translates to:
  /// **'Water bottle'**
  String get q2_2_c;

  /// No description provided for @q2_2_d.
  ///
  /// In en, this message translates to:
  /// **'Umbrella'**
  String get q2_2_d;

  /// No description provided for @q2_3.
  ///
  /// In en, this message translates to:
  /// **'Which of these can trigger asthma symptoms?'**
  String get q2_3;

  /// No description provided for @q2_3_a.
  ///
  /// In en, this message translates to:
  /// **'All of the above'**
  String get q2_3_a;

  /// No description provided for @q2_3_b.
  ///
  /// In en, this message translates to:
  /// **'Smoke'**
  String get q2_3_b;

  /// No description provided for @q2_3_c.
  ///
  /// In en, this message translates to:
  /// **'Dust'**
  String get q2_3_c;

  /// No description provided for @q2_3_d.
  ///
  /// In en, this message translates to:
  /// **'Strong perfumes'**
  String get q2_3_d;

  /// No description provided for @q2_4.
  ///
  /// In en, this message translates to:
  /// **'What is the main job of the Reliever (“Rescue Hero”)?'**
  String get q2_4;

  /// No description provided for @q2_4_a.
  ///
  /// In en, this message translates to:
  /// **'Open the airways quickly'**
  String get q2_4_a;

  /// No description provided for @q2_4_b.
  ///
  /// In en, this message translates to:
  /// **'Prevent attacks for months'**
  String get q2_4_b;

  /// No description provided for @q2_4_c.
  ///
  /// In en, this message translates to:
  /// **'Cure asthma forever'**
  String get q2_4_c;

  /// No description provided for @q2_4_d.
  ///
  /// In en, this message translates to:
  /// **'Help you sleep'**
  String get q2_4_d;

  /// No description provided for @q2_5.
  ///
  /// In en, this message translates to:
  /// **'When should you use the Controller (“Bodyguard”)?'**
  String get q2_5;

  /// No description provided for @q2_5_a.
  ///
  /// In en, this message translates to:
  /// **'Every day as prescribed'**
  String get q2_5_a;

  /// No description provided for @q2_5_b.
  ///
  /// In en, this message translates to:
  /// **'Only during an attack'**
  String get q2_5_b;

  /// No description provided for @q2_5_c.
  ///
  /// In en, this message translates to:
  /// **'Only when exercising'**
  String get q2_5_c;

  /// No description provided for @q2_5_d.
  ///
  /// In en, this message translates to:
  /// **'Once a month'**
  String get q2_5_d;

  /// No description provided for @q2_6.
  ///
  /// In en, this message translates to:
  /// **'Which statement about the Controller is TRUE?'**
  String get q2_6;

  /// No description provided for @q2_6_a.
  ///
  /// In en, this message translates to:
  /// **'It reduces swelling and helps prevent attacks'**
  String get q2_6_a;

  /// No description provided for @q2_6_b.
  ///
  /// In en, this message translates to:
  /// **'It works instantly'**
  String get q2_6_b;

  /// No description provided for @q2_6_c.
  ///
  /// In en, this message translates to:
  /// **'It is only for emergencies'**
  String get q2_6_c;

  /// No description provided for @q2_6_d.
  ///
  /// In en, this message translates to:
  /// **'It replaces the reliever inhaler'**
  String get q2_6_d;

  /// No description provided for @q2_7.
  ///
  /// In en, this message translates to:
  /// **'What should you do if you start coughing, wheezing, or feel chest tightness?'**
  String get q2_7;

  /// No description provided for @q2_7_a.
  ///
  /// In en, this message translates to:
  /// **'Use your Reliever and follow your action plan'**
  String get q2_7_a;

  /// No description provided for @q2_7_b.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q2_7_b;

  /// No description provided for @q2_7_c.
  ///
  /// In en, this message translates to:
  /// **'Drink juice only'**
  String get q2_7_c;

  /// No description provided for @q2_7_d.
  ///
  /// In en, this message translates to:
  /// **'Stop breathing deeply'**
  String get q2_7_d;

  /// No description provided for @q2_8.
  ///
  /// In en, this message translates to:
  /// **'Which daily habit can help control asthma?'**
  String get q2_8;

  /// No description provided for @q2_8_a.
  ///
  /// In en, this message translates to:
  /// **'Following your asthma action plan'**
  String get q2_8_a;

  /// No description provided for @q2_8_b.
  ///
  /// In en, this message translates to:
  /// **'Smoking'**
  String get q2_8_b;

  /// No description provided for @q2_8_c.
  ///
  /// In en, this message translates to:
  /// **'Skipping medications'**
  String get q2_8_c;

  /// No description provided for @q2_8_d.
  ///
  /// In en, this message translates to:
  /// **'Avoiding all exercise forever'**
  String get q2_8_d;

  /// No description provided for @q2_9.
  ///
  /// In en, this message translates to:
  /// **'Why is washing bedding regularly helpful?'**
  String get q2_9;

  /// No description provided for @q2_9_a.
  ///
  /// In en, this message translates to:
  /// **'Reduces dust and allergens'**
  String get q2_9_a;

  /// No description provided for @q2_9_b.
  ///
  /// In en, this message translates to:
  /// **'Makes the bed softer'**
  String get q2_9_b;

  /// No description provided for @q2_9_c.
  ///
  /// In en, this message translates to:
  /// **'Changes the color'**
  String get q2_9_c;

  /// No description provided for @q2_9_d.
  ///
  /// In en, this message translates to:
  /// **'Prevents wrinkles'**
  String get q2_9_d;

  /// No description provided for @q2_10.
  ///
  /// In en, this message translates to:
  /// **'Which habit is BEST for healthy lungs?'**
  String get q2_10;

  /// No description provided for @q2_10_a.
  ///
  /// In en, this message translates to:
  /// **'Avoiding secondhand smoke'**
  String get q2_10_a;

  /// No description provided for @q2_10_b.
  ///
  /// In en, this message translates to:
  /// **'Smoking occasionally'**
  String get q2_10_b;

  /// No description provided for @q2_10_c.
  ///
  /// In en, this message translates to:
  /// **'Skipping sleep'**
  String get q2_10_c;

  /// No description provided for @q2_10_d.
  ///
  /// In en, this message translates to:
  /// **'Ignoring symptoms'**
  String get q2_10_d;

  /// No description provided for @quiz3Title.
  ///
  /// In en, this message translates to:
  /// **'Doctor Visit or Not?'**
  String get quiz3Title;

  /// No description provided for @q3_1.
  ///
  /// In en, this message translates to:
  /// **'You wake up coughing and wheezing several nights this week. What should you do?'**
  String get q3_1;

  /// No description provided for @q3_1_a.
  ///
  /// In en, this message translates to:
  /// **'Tell your doctor'**
  String get q3_1_a;

  /// No description provided for @q3_1_b.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q3_1_b;

  /// No description provided for @q3_1_c.
  ///
  /// In en, this message translates to:
  /// **'Wait a month'**
  String get q3_1_c;

  /// No description provided for @q3_1_d.
  ///
  /// In en, this message translates to:
  /// **'Stop all medications'**
  String get q3_1_d;

  /// No description provided for @q3_2.
  ///
  /// In en, this message translates to:
  /// **'Your rescue inhaler is helping less than usual. What does this mean?'**
  String get q3_2;

  /// No description provided for @q3_2_a.
  ///
  /// In en, this message translates to:
  /// **'Your asthma may be worsening'**
  String get q3_2_a;

  /// No description provided for @q3_2_b.
  ///
  /// In en, this message translates to:
  /// **'Everything is fine'**
  String get q3_2_b;

  /// No description provided for @q3_2_c.
  ///
  /// In en, this message translates to:
  /// **'You need more coffee'**
  String get q3_2_c;

  /// No description provided for @q3_2_d.
  ///
  /// In en, this message translates to:
  /// **'Exercise harder'**
  String get q3_2_d;

  /// No description provided for @q3_3.
  ///
  /// In en, this message translates to:
  /// **'Asthma keeps stopping you from exercising and playing with friends. What should you do?'**
  String get q3_3;

  /// No description provided for @q3_3_a.
  ///
  /// In en, this message translates to:
  /// **'See your doctor for advice'**
  String get q3_3_a;

  /// No description provided for @q3_3_b.
  ///
  /// In en, this message translates to:
  /// **'Quit all activities forever'**
  String get q3_3_b;

  /// No description provided for @q3_3_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q3_3_c;

  /// No description provided for @q3_3_d.
  ///
  /// In en, this message translates to:
  /// **'Throw away your inhaler'**
  String get q3_3_d;

  /// No description provided for @q3_4.
  ///
  /// In en, this message translates to:
  /// **'Your peak flow readings are lower than usual for several days. What’s the best action?'**
  String get q3_4;

  /// No description provided for @q3_4_a.
  ///
  /// In en, this message translates to:
  /// **'Discuss it with your doctor'**
  String get q3_4_a;

  /// No description provided for @q3_4_b.
  ///
  /// In en, this message translates to:
  /// **'Celebrate'**
  String get q3_4_b;

  /// No description provided for @q3_4_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore them'**
  String get q3_4_c;

  /// No description provided for @q3_4_d.
  ///
  /// In en, this message translates to:
  /// **'Stop measuring'**
  String get q3_4_d;

  /// No description provided for @q3_5.
  ///
  /// In en, this message translates to:
  /// **'You notice side effects after starting a new asthma medication. What should you do?'**
  String get q3_5;

  /// No description provided for @q3_5_a.
  ///
  /// In en, this message translates to:
  /// **'See your doctor'**
  String get q3_5_a;

  /// No description provided for @q3_5_b.
  ///
  /// In en, this message translates to:
  /// **'Double the dose'**
  String get q3_5_b;

  /// No description provided for @q3_5_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore them'**
  String get q3_5_c;

  /// No description provided for @q3_5_d.
  ///
  /// In en, this message translates to:
  /// **'Stop all treatment without advice'**
  String get q3_5_d;

  /// No description provided for @q3_6.
  ///
  /// In en, this message translates to:
  /// **'You have asthma and develop fever with colored mucus. What should you do?'**
  String get q3_6;

  /// No description provided for @q3_6_a.
  ///
  /// In en, this message translates to:
  /// **'See your doctor'**
  String get q3_6_a;

  /// No description provided for @q3_6_b.
  ///
  /// In en, this message translates to:
  /// **'Wait until next year'**
  String get q3_6_b;

  /// No description provided for @q3_6_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q3_6_c;

  /// No description provided for @q3_6_d.
  ///
  /// In en, this message translates to:
  /// **'Exercise more'**
  String get q3_6_d;

  /// No description provided for @q3_7.
  ///
  /// In en, this message translates to:
  /// **'This is your first-ever episode of wheezing. What should you do?'**
  String get q3_7;

  /// No description provided for @q3_7_a.
  ///
  /// In en, this message translates to:
  /// **'See a healthcare professional'**
  String get q3_7_a;

  /// No description provided for @q3_7_b.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q3_7_b;

  /// No description provided for @q3_7_c.
  ///
  /// In en, this message translates to:
  /// **'Assume it is normal'**
  String get q3_7_c;

  /// No description provided for @q3_7_d.
  ///
  /// In en, this message translates to:
  /// **'Take random medicine'**
  String get q3_7_d;

  /// No description provided for @q3_8.
  ///
  /// In en, this message translates to:
  /// **'You needed emergency treatment twice this year for asthma. What does this suggest?'**
  String get q3_8;

  /// No description provided for @q3_8_a.
  ///
  /// In en, this message translates to:
  /// **'Your asthma should be reviewed by a doctor'**
  String get q3_8_a;

  /// No description provided for @q3_8_b.
  ///
  /// In en, this message translates to:
  /// **'Everything is controlled'**
  String get q3_8_b;

  /// No description provided for @q3_8_c.
  ///
  /// In en, this message translates to:
  /// **'Stop follow-up visits'**
  String get q3_8_c;

  /// No description provided for @q3_8_d.
  ///
  /// In en, this message translates to:
  /// **'Asthma is gone'**
  String get q3_8_d;

  /// No description provided for @q3_9.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy is making asthma symptoms harder to control. What should you do?'**
  String get q3_9;

  /// No description provided for @q3_9_a.
  ///
  /// In en, this message translates to:
  /// **'See your doctor'**
  String get q3_9_a;

  /// No description provided for @q3_9_b.
  ///
  /// In en, this message translates to:
  /// **'Stop all asthma medicines'**
  String get q3_9_b;

  /// No description provided for @q3_9_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore symptoms'**
  String get q3_9_c;

  /// No description provided for @q3_9_d.
  ///
  /// In en, this message translates to:
  /// **'Only drink water'**
  String get q3_9_d;

  /// No description provided for @q3_10.
  ///
  /// In en, this message translates to:
  /// **'Which situation is a reason to schedule a medical review?'**
  String get q3_10;

  /// No description provided for @q3_10_a.
  ///
  /// In en, this message translates to:
  /// **'Symptoms becoming more frequent'**
  String get q3_10_a;

  /// No description provided for @q3_10_b.
  ///
  /// In en, this message translates to:
  /// **'Feeling well-controlled'**
  String get q3_10_b;

  /// No description provided for @q3_10_c.
  ///
  /// In en, this message translates to:
  /// **'Having no symptoms'**
  String get q3_10_c;

  /// No description provided for @q3_10_d.
  ///
  /// In en, this message translates to:
  /// **'Following your treatment plan successfully'**
  String get q3_10_d;

  /// No description provided for @quiz4Title.
  ///
  /// In en, this message translates to:
  /// **'Emergency or Not?'**
  String get quiz4Title;

  /// No description provided for @q4_1.
  ///
  /// In en, this message translates to:
  /// **'You are so short of breath that breathing feels very difficult. What should you do?'**
  String get q4_1;

  /// No description provided for @q4_1_a.
  ///
  /// In en, this message translates to:
  /// **'Go to the Emergency Room immediately'**
  String get q4_1_a;

  /// No description provided for @q4_1_b.
  ///
  /// In en, this message translates to:
  /// **'Take a nap'**
  String get q4_1_b;

  /// No description provided for @q4_1_c.
  ///
  /// In en, this message translates to:
  /// **'Wait until tomorrow'**
  String get q4_1_c;

  /// No description provided for @q4_1_d.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q4_1_d;

  /// No description provided for @q4_2.
  ///
  /// In en, this message translates to:
  /// **'You can only speak a few words at a time because of breathing trouble. This is:'**
  String get q4_2;

  /// No description provided for @q4_2_a.
  ///
  /// In en, this message translates to:
  /// **'An emergency'**
  String get q4_2_a;

  /// No description provided for @q4_2_b.
  ///
  /// In en, this message translates to:
  /// **'Normal asthma'**
  String get q4_2_b;

  /// No description provided for @q4_2_c.
  ///
  /// In en, this message translates to:
  /// **'A sign of being tired'**
  String get q4_2_c;

  /// No description provided for @q4_2_d.
  ///
  /// In en, this message translates to:
  /// **'Nothing serious'**
  String get q4_2_d;

  /// No description provided for @q4_3.
  ///
  /// In en, this message translates to:
  /// **'Your rescue inhaler provides little or no relief. What should you do?'**
  String get q4_3;

  /// No description provided for @q4_3_a.
  ///
  /// In en, this message translates to:
  /// **'Check Asthma action plan to know exactly what to do'**
  String get q4_3_a;

  /// No description provided for @q4_3_b.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q4_3_b;

  /// No description provided for @q4_3_c.
  ///
  /// In en, this message translates to:
  /// **'Wait several days'**
  String get q4_3_c;

  /// No description provided for @q4_3_d.
  ///
  /// In en, this message translates to:
  /// **'Stop breathing exercises forever'**
  String get q4_3_d;

  /// No description provided for @q4_4.
  ///
  /// In en, this message translates to:
  /// **'Your lips are turning blue or gray. What does this mean?'**
  String get q4_4;

  /// No description provided for @q4_4_a.
  ///
  /// In en, this message translates to:
  /// **'Emergency—seek help now'**
  String get q4_4_a;

  /// No description provided for @q4_4_b.
  ///
  /// In en, this message translates to:
  /// **'Normal asthma'**
  String get q4_4_b;

  /// No description provided for @q4_4_c.
  ///
  /// In en, this message translates to:
  /// **'You’re cold'**
  String get q4_4_c;

  /// No description provided for @q4_4_d.
  ///
  /// In en, this message translates to:
  /// **'You need water'**
  String get q4_4_d;

  /// No description provided for @q4_5.
  ///
  /// In en, this message translates to:
  /// **'Your coughing and wheezing are getting worse very quickly. What should you do?'**
  String get q4_5;

  /// No description provided for @q4_5_a.
  ///
  /// In en, this message translates to:
  /// **'Emergency care is needed'**
  String get q4_5_a;

  /// No description provided for @q4_5_b.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q4_5_b;

  /// No description provided for @q4_5_c.
  ///
  /// In en, this message translates to:
  /// **'Go jogging'**
  String get q4_5_c;

  /// No description provided for @q4_5_d.
  ///
  /// In en, this message translates to:
  /// **'Stop monitoring symptoms'**
  String get q4_5_d;

  /// No description provided for @q4_6.
  ///
  /// In en, this message translates to:
  /// **'Chest tightness continues even after using your rescue inhaler. What should you do?'**
  String get q4_6;

  /// No description provided for @q4_6_a.
  ///
  /// In en, this message translates to:
  /// **'Seek emergency help'**
  String get q4_6_a;

  /// No description provided for @q4_6_b.
  ///
  /// In en, this message translates to:
  /// **'Wait a week'**
  String get q4_6_b;

  /// No description provided for @q4_6_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q4_6_c;

  /// No description provided for @q4_6_d.
  ///
  /// In en, this message translates to:
  /// **'Stop treatment'**
  String get q4_6_d;

  /// No description provided for @q4_7.
  ///
  /// In en, this message translates to:
  /// **'Which sign is especially dangerous?'**
  String get q4_7;

  /// No description provided for @q4_7_a.
  ///
  /// In en, this message translates to:
  /// **'Silent chest (very little air movement)'**
  String get q4_7_a;

  /// No description provided for @q4_7_b.
  ///
  /// In en, this message translates to:
  /// **'Sneezing'**
  String get q4_7_b;

  /// No description provided for @q4_7_c.
  ///
  /// In en, this message translates to:
  /// **'Hiccups'**
  String get q4_7_c;

  /// No description provided for @q4_7_d.
  ///
  /// In en, this message translates to:
  /// **'Mild headache'**
  String get q4_7_d;

  /// No description provided for @q4_8.
  ///
  /// In en, this message translates to:
  /// **'You feel dizzy, confused, and extremely tired during an asthma attack. What should you do?'**
  String get q4_8;

  /// No description provided for @q4_8_a.
  ///
  /// In en, this message translates to:
  /// **'Seek emergency help immediately'**
  String get q4_8_a;

  /// No description provided for @q4_8_b.
  ///
  /// In en, this message translates to:
  /// **'Take a selfie'**
  String get q4_8_b;

  /// No description provided for @q4_8_c.
  ///
  /// In en, this message translates to:
  /// **'Ignore it'**
  String get q4_8_c;

  /// No description provided for @q4_8_d.
  ///
  /// In en, this message translates to:
  /// **'Wait until bedtime'**
  String get q4_8_d;

  /// No description provided for @q4_9.
  ///
  /// In en, this message translates to:
  /// **'Your symptoms keep worsening despite treatment. What does this mean?'**
  String get q4_9;

  /// No description provided for @q4_9_a.
  ///
  /// In en, this message translates to:
  /// **'Emergency evaluation is needed'**
  String get q4_9_a;

  /// No description provided for @q4_9_b.
  ///
  /// In en, this message translates to:
  /// **'Treatment is working'**
  String get q4_9_b;

  /// No description provided for @q4_9_c.
  ///
  /// In en, this message translates to:
  /// **'Asthma is improving'**
  String get q4_9_c;

  /// No description provided for @q4_9_d.
  ///
  /// In en, this message translates to:
  /// **'Nothing is wrong'**
  String get q4_9_d;

  /// No description provided for @q4_10.
  ///
  /// In en, this message translates to:
  /// **'Which of these is an asthma emergency?'**
  String get q4_10;

  /// No description provided for @q4_10_a.
  ///
  /// In en, this message translates to:
  /// **'Confusion or drowsiness during an attack'**
  String get q4_10_a;

  /// No description provided for @q4_10_b.
  ///
  /// In en, this message translates to:
  /// **'Controlled symptoms'**
  String get q4_10_b;

  /// No description provided for @q4_10_c.
  ///
  /// In en, this message translates to:
  /// **'Feeling energetic'**
  String get q4_10_c;

  /// No description provided for @q4_10_d.
  ///
  /// In en, this message translates to:
  /// **'Having a good peak flow reading'**
  String get q4_10_d;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
