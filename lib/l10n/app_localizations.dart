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

  /// No description provided for @medicationRemindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Medication Reminders'**
  String get medicationRemindersTitle;

  /// No description provided for @medicationRemindersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set the start time and how often to repeat for each medicine.'**
  String get medicationRemindersSubtitle;

  /// No description provided for @maxMedicationsError.
  ///
  /// In en, this message translates to:
  /// **'Maximum 5 medications allowed'**
  String get maxMedicationsError;

  /// No description provided for @enterMedicineLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Medicine {index}'**
  String enterMedicineLabel(int index);

  /// No description provided for @firstDose.
  ///
  /// In en, this message translates to:
  /// **'First Dose'**
  String get firstDose;

  /// No description provided for @everyIntervalLabel.
  ///
  /// In en, this message translates to:
  /// **'Every'**
  String get everyIntervalLabel;

  /// No description provided for @hoursValue.
  ///
  /// In en, this message translates to:
  /// **'{hours} hrs'**
  String hoursValue(int hours);

  /// No description provided for @addAnotherMedication.
  ///
  /// In en, this message translates to:
  /// **'Add Another Medication'**
  String get addAnotherMedication;

  /// No description provided for @fillAllDetailsError.
  ///
  /// In en, this message translates to:
  /// **'Please fill all details.'**
  String get fillAllDetailsError;

  /// No description provided for @remindersSavedMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminders saved and active!'**
  String get remindersSavedMessage;

  /// No description provided for @setTimersButton.
  ///
  /// In en, this message translates to:
  /// **'Set Timers'**
  String get setTimersButton;

  /// No description provided for @activeRemindersTitle.
  ///
  /// In en, this message translates to:
  /// **'Active Reminders'**
  String get activeRemindersTitle;

  /// No description provided for @noActiveReminders.
  ///
  /// In en, this message translates to:
  /// **'No active reminders.'**
  String get noActiveReminders;

  /// No description provided for @reminderRemovedMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} reminder removed'**
  String reminderRemovedMessage(String name);

  /// No description provided for @undoAction.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undoAction;

  /// No description provided for @reminderRestoredMessage.
  ///
  /// In en, this message translates to:
  /// **'Reminder restored'**
  String get reminderRestoredMessage;

  /// No description provided for @reminderSubtitleInfo.
  ///
  /// In en, this message translates to:
  /// **'Started at {time} • Every {hours}h'**
  String reminderSubtitleInfo(String time, int hours);

  /// No description provided for @editFieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit {label}'**
  String editFieldTitle(String label);

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveAction;

  /// No description provided for @medicationRemindersMenu.
  ///
  /// In en, this message translates to:
  /// **'Medication Reminders'**
  String get medicationRemindersMenu;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @carouselBasicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Asthma Basics'**
  String get carouselBasicsTitle;

  /// No description provided for @carouselBasicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn the basics of asthma and its symptoms.'**
  String get carouselBasicsSubtitle;

  /// No description provided for @carouselTriggersTitle.
  ///
  /// In en, this message translates to:
  /// **'Asthma Triggers'**
  String get carouselTriggersTitle;

  /// No description provided for @carouselTriggersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Identify and minimize daily irritants to keep your lungs healthy.'**
  String get carouselTriggersSubtitle;

  /// No description provided for @carouselHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'When to Seek Help'**
  String get carouselHelpTitle;

  /// No description provided for @carouselHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn the warning signs of worsening asthma and when to seek care.'**
  String get carouselHelpSubtitle;

  /// No description provided for @carouselInhalerTitle.
  ///
  /// In en, this message translates to:
  /// **'Inhaler Techniques'**
  String get carouselInhalerTitle;

  /// No description provided for @carouselInhalerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Master your proper inhaler usage step-by-step for better relief.'**
  String get carouselInhalerSubtitle;

  /// No description provided for @trackedTodayTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set for today!'**
  String get trackedTodayTitle;

  /// No description provided for @trackedTodaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap a square to see past data'**
  String get trackedTodaySubtitle;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @questionProgress.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionProgress(int current, int total);

  /// No description provided for @yesLabel.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesLabel;

  /// No description provided for @noLabel.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noLabel;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @submitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButton;

  /// No description provided for @assessmentResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Assessment Result'**
  String get assessmentResultTitle;

  /// No description provided for @logDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Log: {day}/{month}/{year}'**
  String logDateTitle(int day, int month, int year);

  /// No description provided for @okAction.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okAction;

  /// No description provided for @wellControlledAsthma.
  ///
  /// In en, this message translates to:
  /// **'Well Controlled Asthma'**
  String get wellControlledAsthma;

  /// No description provided for @partlyControlledAsthma.
  ///
  /// In en, this message translates to:
  /// **'Partly Controlled Asthma'**
  String get partlyControlledAsthma;

  /// No description provided for @uncontrolledAsthma.
  ///
  /// In en, this message translates to:
  /// **'Uncontrolled Asthma'**
  String get uncontrolledAsthma;

  /// No description provided for @questionDaytime.
  ///
  /// In en, this message translates to:
  /// **'Daytime symptoms more than twice/week?'**
  String get questionDaytime;

  /// No description provided for @questionNightWaking.
  ///
  /// In en, this message translates to:
  /// **'Any night waking due to asthma?'**
  String get questionNightWaking;

  /// No description provided for @questionRescueInhaler.
  ///
  /// In en, this message translates to:
  /// **'Rescue inhaler needed more than twice/week?'**
  String get questionRescueInhaler;

  /// No description provided for @questionActivityLimitation.
  ///
  /// In en, this message translates to:
  /// **'Any activity limitation due to asthma?'**
  String get questionActivityLimitation;

  /// No description provided for @reminderText.
  ///
  /// In en, this message translates to:
  /// **'Feeling well? Take your Controller as prescribed.\n\nStarting to cough, wheeze, or feel tight-chested?\nUse your Reliever and follow your asthma action plan.'**
  String get reminderText;

  /// No description provided for @pdfTitle.
  ///
  /// In en, this message translates to:
  /// **'Asthma Action Plan'**
  String get pdfTitle;

  /// No description provided for @openPdf.
  ///
  /// In en, this message translates to:
  /// **'Open PDF'**
  String get openPdf;

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

  /// No description provided for @numberOfQuestions.
  ///
  /// In en, this message translates to:
  /// **'{count} questions'**
  String numberOfQuestions(int count);

  /// No description provided for @quizScoreDisplay.
  ///
  /// In en, this message translates to:
  /// **'Score: {score}/{total}'**
  String quizScoreDisplay(int score, int total);

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

  /// No description provided for @quizTriggersPart1Title.
  ///
  /// In en, this message translates to:
  /// **'Asthma Triggers: Home & Environment'**
  String get quizTriggersPart1Title;

  /// No description provided for @quizTriggersPart2Title.
  ///
  /// In en, this message translates to:
  /// **'Asthma Triggers: Lifestyle & Health'**
  String get quizTriggersPart2Title;

  /// No description provided for @quizInhalersPart1Title.
  ///
  /// In en, this message translates to:
  /// **'Inhalers: Controller vs. Reliever'**
  String get quizInhalersPart1Title;

  /// No description provided for @quizInhalersPart2Title.
  ///
  /// In en, this message translates to:
  /// **'Inhalers: Setup & Best Practices'**
  String get quizInhalersPart2Title;

  /// No description provided for @t1_1.
  ///
  /// In en, this message translates to:
  /// **'Which of the following types of smoke should an asthma patient avoid?'**
  String get t1_1;

  /// No description provided for @t1_1_a.
  ///
  /// In en, this message translates to:
  /// **'Cigarette smoke, shisha, vaping, and burning odors'**
  String get t1_1_a;

  /// No description provided for @t1_1_b.
  ///
  /// In en, this message translates to:
  /// **'Cigarette smoke only'**
  String get t1_1_b;

  /// No description provided for @t1_1_c.
  ///
  /// In en, this message translates to:
  /// **'Shisha and vaping only'**
  String get t1_1_c;

  /// No description provided for @t1_1_d.
  ///
  /// In en, this message translates to:
  /// **'Only outdoor smoke'**
  String get t1_1_d;

  /// No description provided for @t1_2.
  ///
  /// In en, this message translates to:
  /// **'What is recommended to decrease dust mites in an asthma patient\'s bed?'**
  String get t1_2;

  /// No description provided for @t1_2_a.
  ///
  /// In en, this message translates to:
  /// **'Using mattress and pillow covers'**
  String get t1_2_a;

  /// No description provided for @t1_2_b.
  ///
  /// In en, this message translates to:
  /// **'Changing the bed frame'**
  String get t1_2_b;

  /// No description provided for @t1_2_c.
  ///
  /// In en, this message translates to:
  /// **'Sleeping without pillows'**
  String get t1_2_c;

  /// No description provided for @t1_2_d.
  ///
  /// In en, this message translates to:
  /// **'Keeping the window open all night'**
  String get t1_2_d;

  /// No description provided for @t1_3.
  ///
  /// In en, this message translates to:
  /// **'Which of the following household habits helps reduce environmental allergens for asthma patients?'**
  String get t1_3;

  /// No description provided for @t1_3_a.
  ///
  /// In en, this message translates to:
  /// **'Keeping the home clean and well-ventilated'**
  String get t1_3_a;

  /// No description provided for @t1_3_b.
  ///
  /// In en, this message translates to:
  /// **'Keeping the home closed off and unventilated'**
  String get t1_3_b;

  /// No description provided for @t1_3_c.
  ///
  /// In en, this message translates to:
  /// **'Sweeping dust into the air'**
  String get t1_3_c;

  /// No description provided for @t1_3_d.
  ///
  /// In en, this message translates to:
  /// **'Using multiple air fresheners'**
  String get t1_3_d;

  /// No description provided for @t1_4.
  ///
  /// In en, this message translates to:
  /// **'Which annual vaccine should an asthma patient consider to prevent symptom-worsening infections?'**
  String get t1_4;

  /// No description provided for @t1_4_a.
  ///
  /// In en, this message translates to:
  /// **'Yearly flu vaccine'**
  String get t1_4_a;

  /// No description provided for @t1_4_b.
  ///
  /// In en, this message translates to:
  /// **'Tetanus vaccine'**
  String get t1_4_b;

  /// No description provided for @t1_4_c.
  ///
  /// In en, this message translates to:
  /// **'Hepatitis vaccine'**
  String get t1_4_c;

  /// No description provided for @t1_4_d.
  ///
  /// In en, this message translates to:
  /// **'Chickenpox vaccine'**
  String get t1_4_d;

  /// No description provided for @t1_5.
  ///
  /// In en, this message translates to:
  /// **'If exercise triggers asthma symptoms, what should a patient do if advised by their doctor?'**
  String get t1_5;

  /// No description provided for @t1_5_a.
  ///
  /// In en, this message translates to:
  /// **'Use their prescribed inhaler before exercise'**
  String get t1_5_a;

  /// No description provided for @t1_5_b.
  ///
  /// In en, this message translates to:
  /// **'Stop exercising completely'**
  String get t1_5_b;

  /// No description provided for @t1_5_c.
  ///
  /// In en, this message translates to:
  /// **'Exercise only in freezing weather'**
  String get t1_5_c;

  /// No description provided for @t1_5_d.
  ///
  /// In en, this message translates to:
  /// **'Drink a sugary beverage before running'**
  String get t1_5_d;

  /// No description provided for @t1_6.
  ///
  /// In en, this message translates to:
  /// **'Which over-the-counter pain medication is explicitly listed as a potential asthma trigger?'**
  String get t1_6;

  /// No description provided for @t1_6_a.
  ///
  /// In en, this message translates to:
  /// **'Ibuprofen (an NSAID)'**
  String get t1_6_a;

  /// No description provided for @t1_6_b.
  ///
  /// In en, this message translates to:
  /// **'Acetaminophen'**
  String get t1_6_b;

  /// No description provided for @t1_6_c.
  ///
  /// In en, this message translates to:
  /// **'Vitamin C'**
  String get t1_6_c;

  /// No description provided for @t1_6_d.
  ///
  /// In en, this message translates to:
  /// **'Antacids'**
  String get t1_6_d;

  /// No description provided for @t1_7.
  ///
  /// In en, this message translates to:
  /// **'Besides aspirin and NSAIDs, which class of medications is mentioned as a potential asthma trigger?'**
  String get t1_7;

  /// No description provided for @t1_7_a.
  ///
  /// In en, this message translates to:
  /// **'Beta-blockers'**
  String get t1_7_a;

  /// No description provided for @t1_7_b.
  ///
  /// In en, this message translates to:
  /// **'Antibiotics'**
  String get t1_7_b;

  /// No description provided for @t1_7_c.
  ///
  /// In en, this message translates to:
  /// **'Antihistamines'**
  String get t1_7_c;

  /// No description provided for @t1_7_d.
  ///
  /// In en, this message translates to:
  /// **'Cough syrups'**
  String get t1_7_d;

  /// No description provided for @t1_8.
  ///
  /// In en, this message translates to:
  /// **'What simple hygiene habit is recommended to help prevent respiratory infections like the flu or colds?'**
  String get t1_8;

  /// No description provided for @t1_8_a.
  ///
  /// In en, this message translates to:
  /// **'Washing hands regularly'**
  String get t1_8_a;

  /// No description provided for @t1_8_b.
  ///
  /// In en, this message translates to:
  /// **'Wearing heavy perfume'**
  String get t1_8_b;

  /// No description provided for @t1_8_c.
  ///
  /// In en, this message translates to:
  /// **'Avoiding the use of mattress covers'**
  String get t1_8_c;

  /// No description provided for @t1_8_d.
  ///
  /// In en, this message translates to:
  /// **'Exercising without using an inhaler'**
  String get t1_8_d;

  /// No description provided for @t1_9.
  ///
  /// In en, this message translates to:
  /// **'Besides smoke and dust, what other air conditions are listed as a \"bad air day\" trigger?'**
  String get t1_9;

  /// No description provided for @t1_9_a.
  ///
  /// In en, this message translates to:
  /// **'Pollution and sandstorms'**
  String get t1_9_a;

  /// No description provided for @t1_9_b.
  ///
  /// In en, this message translates to:
  /// **'High oxygen levels'**
  String get t1_9_b;

  /// No description provided for @t1_9_c.
  ///
  /// In en, this message translates to:
  /// **'Fog and morning dew'**
  String get t1_9_c;

  /// No description provided for @t1_9_d.
  ///
  /// In en, this message translates to:
  /// **'Gentle summer breezes'**
  String get t1_9_d;

  /// No description provided for @t1_10.
  ///
  /// In en, this message translates to:
  /// **'How can physical activity or \"running like you\'re in the Olympics\" affect some asthma patients?'**
  String get t1_10;

  /// No description provided for @t1_10_a.
  ///
  /// In en, this message translates to:
  /// **'It acts as a trigger for asthma symptoms.'**
  String get t1_10_a;

  /// No description provided for @t1_10_b.
  ///
  /// In en, this message translates to:
  /// **'It always cures asthma symptoms permanently.'**
  String get t1_10_b;

  /// No description provided for @t1_10_c.
  ///
  /// In en, this message translates to:
  /// **'It prevents the need for a rescue inhaler.'**
  String get t1_10_c;

  /// No description provided for @t1_10_d.
  ///
  /// In en, this message translates to:
  /// **'It eliminates the effect of pollen.'**
  String get t1_10_d;

  /// No description provided for @t2_1.
  ///
  /// In en, this message translates to:
  /// **'Which of the following sets of medications contains known triggers for some individuals with asthma?'**
  String get t2_1;

  /// No description provided for @t2_1_a.
  ///
  /// In en, this message translates to:
  /// **'Aspirin, Ibuprofen (NSAIDs), and certain beta-blockers'**
  String get t2_1_a;

  /// No description provided for @t2_1_b.
  ///
  /// In en, this message translates to:
  /// **'Vitamins and minerals'**
  String get t2_1_b;

  /// No description provided for @t2_1_c.
  ///
  /// In en, this message translates to:
  /// **'Antibiotics and cough syrups'**
  String get t2_1_c;

  /// No description provided for @t2_1_d.
  ///
  /// In en, this message translates to:
  /// **'Antacids and anti-allergy pills'**
  String get t2_1_d;

  /// No description provided for @t2_2.
  ///
  /// In en, this message translates to:
  /// **'What can happen to an asthma patient who is around someone smoking a shisha or vaping?'**
  String get t2_2;

  /// No description provided for @t2_2_a.
  ///
  /// In en, this message translates to:
  /// **'Their asthma symptoms can get worse.'**
  String get t2_2_a;

  /// No description provided for @t2_2_b.
  ///
  /// In en, this message translates to:
  /// **'Their lungs become completely immune to dust.'**
  String get t2_2_b;

  /// No description provided for @t2_2_c.
  ///
  /// In en, this message translates to:
  /// **'They will no longer need a rescue inhaler.'**
  String get t2_2_c;

  /// No description provided for @t2_2_d.
  ///
  /// In en, this message translates to:
  /// **'Their exercise performance will improve'**
  String get t2_2_d;

  /// No description provided for @t2_3.
  ///
  /// In en, this message translates to:
  /// **'What type of household spray can act as a trigger and cause an asthma attack?'**
  String get t2_3;

  /// No description provided for @t2_3_a.
  ///
  /// In en, this message translates to:
  /// **'Chemical cleaning sprays'**
  String get t2_3_a;

  /// No description provided for @t2_3_b.
  ///
  /// In en, this message translates to:
  /// **'Water mist spray'**
  String get t2_3_b;

  /// No description provided for @t2_3_c.
  ///
  /// In en, this message translates to:
  /// **'Saline nasal sprays'**
  String get t2_3_c;

  /// No description provided for @t2_3_d.
  ///
  /// In en, this message translates to:
  /// **'Air cooling fans'**
  String get t2_3_d;

  /// No description provided for @t2_4.
  ///
  /// In en, this message translates to:
  /// **'What outdoor trigger comes from trees, grass, and flowers?'**
  String get t2_4;

  /// No description provided for @t2_4_a.
  ///
  /// In en, this message translates to:
  /// **'Pollen'**
  String get t2_4_a;

  /// No description provided for @t2_4_b.
  ///
  /// In en, this message translates to:
  /// **'Dust bunnies'**
  String get t2_4_b;

  /// No description provided for @t2_4_c.
  ///
  /// In en, this message translates to:
  /// **'Chemical fumes'**
  String get t2_4_c;

  /// No description provided for @t2_4_d.
  ///
  /// In en, this message translates to:
  /// **'Pet dander'**
  String get t2_4_d;

  /// No description provided for @t2_5.
  ///
  /// In en, this message translates to:
  /// **'Why should an asthma patient wash their hands regularly?'**
  String get t2_5;

  /// No description provided for @t2_5_a.
  ///
  /// In en, this message translates to:
  /// **'To avoid catching a cold or flu that could worsen asthma'**
  String get t2_5_a;

  /// No description provided for @t2_5_b.
  ///
  /// In en, this message translates to:
  /// **'To remove pollen from their mattress covers'**
  String get t2_5_b;

  /// No description provided for @t2_5_c.
  ///
  /// In en, this message translates to:
  /// **'To protect themselves from cold weather air'**
  String get t2_5_c;

  /// No description provided for @t2_5_d.
  ///
  /// In en, this message translates to:
  /// **'To stop the effects of emotional stress'**
  String get t2_5_d;

  /// No description provided for @t2_6.
  ///
  /// In en, this message translates to:
  /// **'Which of the following describes an indoor environmental trigger found on carpets and furniture?'**
  String get t2_6;

  /// No description provided for @t2_6_a.
  ///
  /// In en, this message translates to:
  /// **'Dust and dust mites'**
  String get t2_6_a;

  /// No description provided for @t2_6_b.
  ///
  /// In en, this message translates to:
  /// **'Shisha smoke'**
  String get t2_6_b;

  /// No description provided for @t2_6_c.
  ///
  /// In en, this message translates to:
  /// **'Sandstorms'**
  String get t2_6_c;

  /// No description provided for @t2_6_d.
  ///
  /// In en, this message translates to:
  /// **'Pollen from outdoor trees'**
  String get t2_6_d;

  /// No description provided for @t2_7.
  ///
  /// In en, this message translates to:
  /// **'What can happen if an asthma patient breathes in chemical fumes from strong products?'**
  String get t2_7;

  /// No description provided for @t2_7_a.
  ///
  /// In en, this message translates to:
  /// **'It can act as a trigger and worsen their asthma.'**
  String get t2_7_a;

  /// No description provided for @t2_7_b.
  ///
  /// In en, this message translates to:
  /// **'Their breathing may become easier.'**
  String get t2_7_b;

  /// No description provided for @t2_7_c.
  ///
  /// In en, this message translates to:
  /// **'It cures their allergy to pet dander.'**
  String get t2_7_c;

  /// No description provided for @t2_7_d.
  ///
  /// In en, this message translates to:
  /// **'It replaces the need for a controller medicine.'**
  String get t2_7_d;

  /// No description provided for @t2_8.
  ///
  /// In en, this message translates to:
  /// **'What is pet dander, which is a known asthma trigger?'**
  String get t2_8;

  /// No description provided for @t2_8_a.
  ///
  /// In en, this message translates to:
  /// **'Tiny bits of skin and fur from furry animals'**
  String get t2_8_a;

  /// No description provided for @t2_8_b.
  ///
  /// In en, this message translates to:
  /// **'A type of medicine used for pain relief'**
  String get t2_8_b;

  /// No description provided for @t2_8_c.
  ///
  /// In en, this message translates to:
  /// **'The chilly air found during winter'**
  String get t2_8_c;

  /// No description provided for @t2_8_d.
  ///
  /// In en, this message translates to:
  /// **'A cleaning spray used for the kitchen'**
  String get t2_8_d;

  /// No description provided for @t2_9.
  ///
  /// In en, this message translates to:
  /// **'If someone with asthma wants to minimize triggers in their bedroom, what is the best habit?'**
  String get t2_9;

  /// No description provided for @t2_9_a.
  ///
  /// In en, this message translates to:
  /// **'Use mattress and pillow covers to decrease dust mites.'**
  String get t2_9_a;

  /// No description provided for @t2_9_b.
  ///
  /// In en, this message translates to:
  /// **'Avoid using any covers on pillows and mattresses.'**
  String get t2_9_b;

  /// No description provided for @t2_9_c.
  ///
  /// In en, this message translates to:
  /// **'Keep the room unventilated and dusty.'**
  String get t2_9_c;

  /// No description provided for @t2_9_d.
  ///
  /// In en, this message translates to:
  /// **'Bring multiple furry pets into the bed.'**
  String get t2_9_d;

  /// No description provided for @t2_10.
  ///
  /// In en, this message translates to:
  /// **'If an asthma patient loves playing with cats or dogs, what specific trigger should they watch out for?'**
  String get t2_10;

  /// No description provided for @t2_10_a.
  ///
  /// In en, this message translates to:
  /// **'Pet dander'**
  String get t2_10_a;

  /// No description provided for @t2_10_b.
  ///
  /// In en, this message translates to:
  /// **'Pollen party'**
  String get t2_10_b;

  /// No description provided for @t2_10_c.
  ///
  /// In en, this message translates to:
  /// **'Burning odors'**
  String get t2_10_c;

  /// No description provided for @t2_10_d.
  ///
  /// In en, this message translates to:
  /// **'Chemical fumes'**
  String get t2_10_d;

  /// No description provided for @i1_1.
  ///
  /// In en, this message translates to:
  /// **'What is the main purpose of a Controller inhaler?'**
  String get i1_1;

  /// No description provided for @i1_1_a.
  ///
  /// In en, this message translates to:
  /// **'To prevent symptoms and asthma attacks by being used every day'**
  String get i1_1_a;

  /// No description provided for @i1_1_b.
  ///
  /// In en, this message translates to:
  /// **'To give instant relief during an asthma attack'**
  String get i1_1_b;

  /// No description provided for @i1_1_c.
  ///
  /// In en, this message translates to:
  /// **'To open the airways within seconds during an emergency'**
  String get i1_1_c;

  /// No description provided for @i1_1_d.
  ///
  /// In en, this message translates to:
  /// **'To clean the lungs after a workout'**
  String get i1_1_d;

  /// No description provided for @i1_2.
  ///
  /// In en, this message translates to:
  /// **'How does a Controller inhaler help the lungs over time?'**
  String get i1_2;

  /// No description provided for @i1_2_a.
  ///
  /// In en, this message translates to:
  /// **'It reduces swelling and inflammation in the airways'**
  String get i1_2_a;

  /// No description provided for @i1_2_b.
  ///
  /// In en, this message translates to:
  /// **'It increases the patient\'s heart rate'**
  String get i1_2_b;

  /// No description provided for @i1_2_c.
  ///
  /// In en, this message translates to:
  /// **'It cures asthma completely after one use'**
  String get i1_2_c;

  /// No description provided for @i1_2_d.
  ///
  /// In en, this message translates to:
  /// **'It acts as a temporary mask for dust'**
  String get i1_2_d;

  /// No description provided for @i1_3.
  ///
  /// In en, this message translates to:
  /// **'When should a patient take their Controller inhaler?'**
  String get i1_3;

  /// No description provided for @i1_3_a.
  ///
  /// In en, this message translates to:
  /// **'Regularly every day, even when feeling well'**
  String get i1_3_a;

  /// No description provided for @i1_3_b.
  ///
  /// In en, this message translates to:
  /// **'Only when they are coughing severely'**
  String get i1_3_b;

  /// No description provided for @i1_3_c.
  ///
  /// In en, this message translates to:
  /// **'Only during an emergency or sudden attack'**
  String get i1_3_c;

  /// No description provided for @i1_3_d.
  ///
  /// In en, this message translates to:
  /// **'Only right before going to sleep'**
  String get i1_3_d;

  /// No description provided for @i1_4.
  ///
  /// In en, this message translates to:
  /// **'Does a Controller inhaler provide quick relief during sudden breathing problems?'**
  String get i1_4;

  /// No description provided for @i1_4_a.
  ///
  /// In en, this message translates to:
  /// **'No, it does not give quick relief during sudden breathing problems'**
  String get i1_4_a;

  /// No description provided for @i1_4_b.
  ///
  /// In en, this message translates to:
  /// **'Yes, it works instantly'**
  String get i1_4_b;

  /// No description provided for @i1_4_c.
  ///
  /// In en, this message translates to:
  /// **'Yes, but only if taken with hot water'**
  String get i1_4_c;

  /// No description provided for @i1_4_d.
  ///
  /// In en, this message translates to:
  /// **'No, it only works if you are exercising'**
  String get i1_4_d;

  /// No description provided for @i1_5.
  ///
  /// In en, this message translates to:
  /// **'Which type of inhaler is referred to as \"emergency help\" or \"The Rescue Inhaler\"?'**
  String get i1_5;

  /// No description provided for @i1_5_a.
  ///
  /// In en, this message translates to:
  /// **'The Reliever inhaler'**
  String get i1_5_a;

  /// No description provided for @i1_5_b.
  ///
  /// In en, this message translates to:
  /// **'The Controller inhaler'**
  String get i1_5_b;

  /// No description provided for @i1_5_c.
  ///
  /// In en, this message translates to:
  /// **'The Nebulizer machine'**
  String get i1_5_c;

  /// No description provided for @i1_5_d.
  ///
  /// In en, this message translates to:
  /// **'The Spacer attachment'**
  String get i1_5_d;

  /// No description provided for @i1_6.
  ///
  /// In en, this message translates to:
  /// **'What is the primary job of a Reliever inhaler?'**
  String get i1_6;

  /// No description provided for @i1_6_a.
  ///
  /// In en, this message translates to:
  /// **'To work quickly to open the airways during symptoms'**
  String get i1_6_a;

  /// No description provided for @i1_6_b.
  ///
  /// In en, this message translates to:
  /// **'To reduce swelling quietly over several weeks'**
  String get i1_6_b;

  /// No description provided for @i1_6_c.
  ///
  /// In en, this message translates to:
  /// **'To replace the need for daily medication'**
  String get i1_6_c;

  /// No description provided for @i1_6_d.
  ///
  /// In en, this message translates to:
  /// **'To track the patient\'s breathing patterns'**
  String get i1_6_d;

  /// No description provided for @i1_7.
  ///
  /// In en, this message translates to:
  /// **'Which of the following symptoms does a Reliever inhaler help relieve?'**
  String get i1_7;

  /// No description provided for @i1_7_a.
  ///
  /// In en, this message translates to:
  /// **'Wheezing, coughing, chest tightness, and shortness of breath'**
  String get i1_7_a;

  /// No description provided for @i1_7_b.
  ///
  /// In en, this message translates to:
  /// **'Skin rashes and itching'**
  String get i1_7_b;

  /// No description provided for @i1_7_c.
  ///
  /// In en, this message translates to:
  /// **'Headaches and fever'**
  String get i1_7_c;

  /// No description provided for @i1_7_d.
  ///
  /// In en, this message translates to:
  /// **'Food allergies and stomach aches'**
  String get i1_7_d;

  /// No description provided for @i1_8.
  ///
  /// In en, this message translates to:
  /// **'When should a patient use their Reliever inhaler?'**
  String get i1_8;

  /// No description provided for @i1_8_a.
  ///
  /// In en, this message translates to:
  /// **'Only when needed or before exercise if prescribed'**
  String get i1_8_a;

  /// No description provided for @i1_8_b.
  ///
  /// In en, this message translates to:
  /// **'Every single morning and evening without fail'**
  String get i1_8_b;

  /// No description provided for @i1_8_c.
  ///
  /// In en, this message translates to:
  /// **'Only when they feel completely fine'**
  String get i1_8_c;

  /// No description provided for @i1_8_d.
  ///
  /// In en, this message translates to:
  /// **'Twice a week whether they have symptoms or not'**
  String get i1_8_d;

  /// No description provided for @i1_9.
  ///
  /// In en, this message translates to:
  /// **'What is a key fact to remember about the Reliever inhaler\'s effect?'**
  String get i1_9;

  /// No description provided for @i1_9_a.
  ///
  /// In en, this message translates to:
  /// **'It fixes the problem right now, but doesn\'t stop asthma from coming back'**
  String get i1_9_a;

  /// No description provided for @i1_9_b.
  ///
  /// In en, this message translates to:
  /// **'It stops asthma from ever coming back'**
  String get i1_9_b;

  /// No description provided for @i1_9_c.
  ///
  /// In en, this message translates to:
  /// **'It takes days or weeks to show its full benefit'**
  String get i1_9_c;

  /// No description provided for @i1_9_d.
  ///
  /// In en, this message translates to:
  /// **'It must be avoided at all costs during an attack'**
  String get i1_9_d;

  /// No description provided for @i1_10.
  ///
  /// In en, this message translates to:
  /// **'What should you do if you start coughing, wheezing, or feeling tight-chested?'**
  String get i1_10;

  /// No description provided for @i1_10_a.
  ///
  /// In en, this message translates to:
  /// **'Use your Reliever inhaler and follow your asthma action plan'**
  String get i1_10_a;

  /// No description provided for @i1_10_b.
  ///
  /// In en, this message translates to:
  /// **'Take your Controller inhaler and go to sleep'**
  String get i1_10_b;

  /// No description provided for @i1_10_c.
  ///
  /// In en, this message translates to:
  /// **'Stop taking all medications completely'**
  String get i1_10_c;

  /// No description provided for @i1_10_d.
  ///
  /// In en, this message translates to:
  /// **'Wait 10 to 15 minutes before doing anything'**
  String get i1_10_d;

  /// No description provided for @i2_1.
  ///
  /// In en, this message translates to:
  /// **'When using a Metered-Dose Inhaler (MDI), how long should you hold your breath after inhaling the medicine?'**
  String get i2_1;

  /// No description provided for @i2_1_a.
  ///
  /// In en, this message translates to:
  /// **'10 seconds'**
  String get i2_1_a;

  /// No description provided for @i2_1_b.
  ///
  /// In en, this message translates to:
  /// **'2 seconds'**
  String get i2_1_b;

  /// No description provided for @i2_1_c.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get i2_1_c;

  /// No description provided for @i2_1_d.
  ///
  /// In en, this message translates to:
  /// **'30 to 60 seconds'**
  String get i2_1_d;

  /// No description provided for @i2_2.
  ///
  /// In en, this message translates to:
  /// **'Where do you put the medicine when preparing a Nebulizer?'**
  String get i2_2;

  /// No description provided for @i2_2_a.
  ///
  /// In en, this message translates to:
  /// **'Inside the nebulizer cup'**
  String get i2_2_a;

  /// No description provided for @i2_2_b.
  ///
  /// In en, this message translates to:
  /// **'Directly onto the mask'**
  String get i2_2_b;

  /// No description provided for @i2_2_c.
  ///
  /// In en, this message translates to:
  /// **'Into the spacer tube'**
  String get i2_2_c;

  /// No description provided for @i2_2_d.
  ///
  /// In en, this message translates to:
  /// **'On the mouthpiece seal'**
  String get i2_2_d;

  /// No description provided for @i2_3.
  ///
  /// In en, this message translates to:
  /// **'How long might a Controller inhaler take to show its full benefit?'**
  String get i2_3;

  /// No description provided for @i2_3_a.
  ///
  /// In en, this message translates to:
  /// **'Days or weeks'**
  String get i2_3_a;

  /// No description provided for @i2_3_b.
  ///
  /// In en, this message translates to:
  /// **'Only 10 seconds'**
  String get i2_3_b;

  /// No description provided for @i2_3_c.
  ///
  /// In en, this message translates to:
  /// **'Immediately during a cough'**
  String get i2_3_c;

  /// No description provided for @i2_3_d.
  ///
  /// In en, this message translates to:
  /// **'Exactly 30 to 60 seconds'**
  String get i2_3_d;

  /// No description provided for @i2_4.
  ///
  /// In en, this message translates to:
  /// **'How should you breathe through a nebulizer mask or mouthpiece while the machine is running?'**
  String get i2_4;

  /// No description provided for @i2_4_a.
  ///
  /// In en, this message translates to:
  /// **'Breathe normally through your mouth'**
  String get i2_4_a;

  /// No description provided for @i2_4_b.
  ///
  /// In en, this message translates to:
  /// **'Hold your breath as long as possible'**
  String get i2_4_b;

  /// No description provided for @i2_4_c.
  ///
  /// In en, this message translates to:
  /// **'Breathe quickly through your nose only'**
  String get i2_4_c;

  /// No description provided for @i2_4_d.
  ///
  /// In en, this message translates to:
  /// **'Take sharp, gasping breaths'**
  String get i2_4_d;

  /// No description provided for @i2_5.
  ///
  /// In en, this message translates to:
  /// **'Which device requires you to turn on a machine to create a mist for breathing?'**
  String get i2_5;

  /// No description provided for @i2_5_a.
  ///
  /// In en, this message translates to:
  /// **'A nebulizer'**
  String get i2_5_a;

  /// No description provided for @i2_5_b.
  ///
  /// In en, this message translates to:
  /// **'A standard MDI'**
  String get i2_5_b;

  /// No description provided for @i2_5_c.
  ///
  /// In en, this message translates to:
  /// **'A spacer tube'**
  String get i2_5_c;

  /// No description provided for @i2_5_d.
  ///
  /// In en, this message translates to:
  /// **'A pillow cover'**
  String get i2_5_d;

  /// No description provided for @i2_6.
  ///
  /// In en, this message translates to:
  /// **'What should you do immediately before you press the canister and breathe in using a standard MDI?'**
  String get i2_6;

  /// No description provided for @i2_6_a.
  ///
  /// In en, this message translates to:
  /// **'Breathe out fully'**
  String get i2_6_a;

  /// No description provided for @i2_6_b.
  ///
  /// In en, this message translates to:
  /// **'Wait 60 seconds'**
  String get i2_6_b;

  /// No description provided for @i2_6_c.
  ///
  /// In en, this message translates to:
  /// **'Wash the cup'**
  String get i2_6_c;

  /// No description provided for @i2_6_d.
  ///
  /// In en, this message translates to:
  /// **'Turn off the machine'**
  String get i2_6_d;

  /// No description provided for @i2_7.
  ///
  /// In en, this message translates to:
  /// **'If you are feeling completely fine, what should you do regarding your Controller inhaler?'**
  String get i2_7;

  /// No description provided for @i2_7_a.
  ///
  /// In en, this message translates to:
  /// **'Take it exactly as prescribed'**
  String get i2_7_a;

  /// No description provided for @i2_7_b.
  ///
  /// In en, this message translates to:
  /// **'Stop taking it until you feel sick'**
  String get i2_7_b;

  /// No description provided for @i2_7_c.
  ///
  /// In en, this message translates to:
  /// **'Replace it with a Reliever inhaler'**
  String get i2_7_c;

  /// No description provided for @i2_7_d.
  ///
  /// In en, this message translates to:
  /// **'Double the dose to stay safe'**
  String get i2_7_d;

  /// No description provided for @i2_8.
  ///
  /// In en, this message translates to:
  /// **'What should you do with a nebulizer machine once the medicine mist completely stops?'**
  String get i2_8;

  /// No description provided for @i2_8_a.
  ///
  /// In en, this message translates to:
  /// **'Turn off the machine and clean the equipment'**
  String get i2_8_a;

  /// No description provided for @i2_8_b.
  ///
  /// In en, this message translates to:
  /// **'Leave it running for another hour'**
  String get i2_8_b;

  /// No description provided for @i2_8_c.
  ///
  /// In en, this message translates to:
  /// **'Add water without turning it off'**
  String get i2_8_c;

  /// No description provided for @i2_8_d.
  ///
  /// In en, this message translates to:
  /// **'Shake it while attached to a spacer'**
  String get i2_8_d;

  /// No description provided for @i2_9.
  ///
  /// In en, this message translates to:
  /// **'Which inhaler is meant for \"Daily Protection\" rather than quick relief?'**
  String get i2_9;

  /// No description provided for @i2_9_a.
  ///
  /// In en, this message translates to:
  /// **'The Controller inhaler'**
  String get i2_9_a;

  /// No description provided for @i2_9_b.
  ///
  /// In en, this message translates to:
  /// **'The Reliever inhaler'**
  String get i2_9_b;

  /// No description provided for @i2_9_c.
  ///
  /// In en, this message translates to:
  /// **'The Rescue Hero'**
  String get i2_9_c;

  /// No description provided for @i2_9_d.
  ///
  /// In en, this message translates to:
  /// **'The Nebulizer cup'**
  String get i2_9_d;

  /// No description provided for @i2_10.
  ///
  /// In en, this message translates to:
  /// **'What is the specific action required right after pressing a standard MDI canister once?'**
  String get i2_10;

  /// No description provided for @i2_10_a.
  ///
  /// In en, this message translates to:
  /// **'Breathe in slowly and deeply'**
  String get i2_10_a;

  /// No description provided for @i2_10_b.
  ///
  /// In en, this message translates to:
  /// **'Shake the inhaler again'**
  String get i2_10_b;

  /// No description provided for @i2_10_c.
  ///
  /// In en, this message translates to:
  /// **'Breathe out slowly and fully'**
  String get i2_10_c;

  /// No description provided for @i2_10_d.
  ///
  /// In en, this message translates to:
  /// **'Wait 30 to 60 seconds before breathing'**
  String get i2_10_d;

  /// No description provided for @eduTriggersHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Staying away from environmental factors that irritate your lungs is key to managing asthma.'**
  String get eduTriggersHeaderDesc;

  /// No description provided for @eduReferralHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Track symptoms closely. Recognize clear warning points to maintain proper asthma control.'**
  String get eduReferralHeaderDesc;

  /// No description provided for @eduSecAirborneIrritants.
  ///
  /// In en, this message translates to:
  /// **'Airborne Irritants'**
  String get eduSecAirborneIrritants;

  /// No description provided for @eduTriggerSmoke.
  ///
  /// In en, this message translates to:
  /// **'Avoid smoke exposure (cigarettes, shisha, vaping, burning odors)'**
  String get eduTriggerSmoke;

  /// No description provided for @eduTriggerAllergens.
  ///
  /// In en, this message translates to:
  /// **'Stay away from dust, pollen, mold, and pet dander if they worsen symptoms'**
  String get eduTriggerAllergens;

  /// No description provided for @eduTriggerChemicals.
  ///
  /// In en, this message translates to:
  /// **'Avoid strong perfumes, cleaning sprays, and chemical fumes'**
  String get eduTriggerChemicals;

  /// No description provided for @eduSecHomeEnv.
  ///
  /// In en, this message translates to:
  /// **'Home & Environment'**
  String get eduSecHomeEnv;

  /// No description provided for @eduTriggerVentilation.
  ///
  /// In en, this message translates to:
  /// **'Keep the home clean and well ventilated to reduce allergens'**
  String get eduTriggerVentilation;

  /// No description provided for @eduTriggerBedCovers.
  ///
  /// In en, this message translates to:
  /// **'Use mattress and pillow covers to decrease dust mites'**
  String get eduTriggerBedCovers;

  /// No description provided for @eduTriggerColdAir.
  ///
  /// In en, this message translates to:
  /// **'Cold air can trigger asthma — cover nose and mouth in cold weather'**
  String get eduTriggerColdAir;

  /// No description provided for @eduSecMedicalLifestyle.
  ///
  /// In en, this message translates to:
  /// **'Medical & Lifestyle'**
  String get eduSecMedicalLifestyle;

  /// No description provided for @eduTriggerInfections.
  ///
  /// In en, this message translates to:
  /// **'Respiratory infections (flu/colds) worsen asthma — wash hands regularly & get flu vaccine'**
  String get eduTriggerInfections;

  /// No description provided for @eduTriggerExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise may trigger symptoms — use prescribed inhaler before exercise if advised'**
  String get eduTriggerExercise;

  /// No description provided for @eduTriggerMeds.
  ///
  /// In en, this message translates to:
  /// **'Avoid specific trigger medicines: aspirin, NSAIDs (Ibuprofen), or some beta blockers'**
  String get eduTriggerMeds;

  /// No description provided for @eduTriggerStress.
  ///
  /// In en, this message translates to:
  /// **'Emotional stress and anxiety can worsen asthma attacks'**
  String get eduTriggerStress;

  /// No description provided for @eduSecConsultDoctor.
  ///
  /// In en, this message translates to:
  /// **'Consult Your Doctor If:'**
  String get eduSecConsultDoctor;

  /// No description provided for @eduRefSevereSymptoms.
  ///
  /// In en, this message translates to:
  /// **'Symptoms are becoming more frequent or more severe'**
  String get eduRefSevereSymptoms;

  /// No description provided for @eduRefRescueInhalerUsage.
  ///
  /// In en, this message translates to:
  /// **'Rescue inhaler is needed more than usual (e.g. several times per week)'**
  String get eduRefRescueInhalerUsage;

  /// No description provided for @eduRefNightAwakening.
  ///
  /// In en, this message translates to:
  /// **'Nighttime awakening due to cough, wheezing, or shortness of breath'**
  String get eduRefNightAwakening;

  /// No description provided for @eduRefDiffBreathingWalking.
  ///
  /// In en, this message translates to:
  /// **'Difficulty speaking, walking, or breathing normally'**
  String get eduRefDiffBreathingWalking;

  /// No description provided for @eduRefLowPeakFlow.
  ///
  /// In en, this message translates to:
  /// **'Peak flow readings are decreasing or staying low'**
  String get eduRefLowPeakFlow;

  /// No description provided for @eduEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'EMERGENCY — Refer Immediately'**
  String get eduEmergencyTitle;

  /// No description provided for @eduEmergShortnessBreath.
  ///
  /// In en, this message translates to:
  /// **'Severe shortness of breath or no improvement after rescue inhaler'**
  String get eduEmergShortnessBreath;

  /// No description provided for @eduEmergSilentChest.
  ///
  /// In en, this message translates to:
  /// **'Silent chest (very little air movement heard)'**
  String get eduEmergSilentChest;

  /// No description provided for @eduEmergBlueLipsNails.
  ///
  /// In en, this message translates to:
  /// **'Lips or fingernails turn blue'**
  String get eduEmergBlueLipsNails;

  /// No description provided for @eduEmergDrowsiness.
  ///
  /// In en, this message translates to:
  /// **'Confusion or drowsiness'**
  String get eduEmergDrowsiness;

  /// No description provided for @eduEmergWorseningStatus.
  ///
  /// In en, this message translates to:
  /// **'Symptoms rapidly worsen despite treatment'**
  String get eduEmergWorseningStatus;

  /// No description provided for @inhalerPageHeaderDesc.
  ///
  /// In en, this message translates to:
  /// **'Select your specific inhaler device type to review the correct step-by-step application technique and instructional training videos.'**
  String get inhalerPageHeaderDesc;

  /// No description provided for @mdiTitle.
  ///
  /// In en, this message translates to:
  /// **'Metered-Dose Inhaler (MDI)'**
  String get mdiTitle;

  /// No description provided for @mdiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Press and breathe slowly'**
  String get mdiSubtitle;

  /// No description provided for @mdiExample1.
  ///
  /// In en, this message translates to:
  /// **'Ventolin Evohaler'**
  String get mdiExample1;

  /// No description provided for @mdiExample2.
  ///
  /// In en, this message translates to:
  /// **'Vental Inhaler'**
  String get mdiExample2;

  /// No description provided for @mdiExample3.
  ///
  /// In en, this message translates to:
  /// **'Seretide Evohaler'**
  String get mdiExample3;

  /// No description provided for @mdiStep1.
  ///
  /// In en, this message translates to:
  /// **'Shake the inhaler.'**
  String get mdiStep1;

  /// No description provided for @mdiStep2.
  ///
  /// In en, this message translates to:
  /// **'Breathe out fully.'**
  String get mdiStep2;

  /// No description provided for @mdiStep3.
  ///
  /// In en, this message translates to:
  /// **'Place mouthpiece in your mouth and seal lips around it.'**
  String get mdiStep3;

  /// No description provided for @mdiStep4.
  ///
  /// In en, this message translates to:
  /// **'Press once and breathe in slowly and deeply.'**
  String get mdiStep4;

  /// No description provided for @mdiStep5.
  ///
  /// In en, this message translates to:
  /// **'Hold your breath for 10 seconds.'**
  String get mdiStep5;

  /// No description provided for @mdiStep6.
  ///
  /// In en, this message translates to:
  /// **'Breathe out slowly.'**
  String get mdiStep6;

  /// No description provided for @mdiStep7.
  ///
  /// In en, this message translates to:
  /// **'Wait 30–60 seconds before a second puff if prescribed.'**
  String get mdiStep7;

  /// No description provided for @spacerTitle.
  ///
  /// In en, this message translates to:
  /// **'MDI with Spacer'**
  String get spacerTitle;

  /// No description provided for @spacerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Uses a chamber for easier breathing'**
  String get spacerSubtitle;

  /// No description provided for @spacerExample1.
  ///
  /// In en, this message translates to:
  /// **'Ventolin + AeroChamber Spacer'**
  String get spacerExample1;

  /// No description provided for @spacerExample2.
  ///
  /// In en, this message translates to:
  /// **'Seretide Evohaler + Spacer'**
  String get spacerExample2;

  /// No description provided for @spacerExample3.
  ///
  /// In en, this message translates to:
  /// **'Floxitide Evohaler + Spacer'**
  String get spacerExample3;

  /// No description provided for @spacerStep1.
  ///
  /// In en, this message translates to:
  /// **'Shake inhaler and attach it to the spacer.'**
  String get spacerStep1;

  /// No description provided for @spacerStep2.
  ///
  /// In en, this message translates to:
  /// **'Breathe out fully.'**
  String get spacerStep2;

  /// No description provided for @spacerStep3.
  ///
  /// In en, this message translates to:
  /// **'Place spacer mouthpiece in your mouth.'**
  String get spacerStep3;

  /// No description provided for @spacerStep4.
  ///
  /// In en, this message translates to:
  /// **'Press the inhaler once into the spacer.'**
  String get spacerStep4;

  /// No description provided for @spacerStep5.
  ///
  /// In en, this message translates to:
  /// **'Take a slow deep breath in or 4–5 normal breaths.'**
  String get spacerStep5;

  /// No description provided for @spacerStep6.
  ///
  /// In en, this message translates to:
  /// **'Hold your breath for 10 seconds if possible.'**
  String get spacerStep6;

  /// No description provided for @spacerStep7.
  ///
  /// In en, this message translates to:
  /// **'Repeat if another puff is needed.'**
  String get spacerStep7;

  /// No description provided for @nebulizerTitle.
  ///
  /// In en, this message translates to:
  /// **'Nebulizer'**
  String get nebulizerTitle;

  /// No description provided for @nebulizerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Converts liquid medicine into a mist'**
  String get nebulizerSubtitle;

  /// No description provided for @nebulizerExample1.
  ///
  /// In en, this message translates to:
  /// **'Ventolin Nebules'**
  String get nebulizerExample1;

  /// No description provided for @nebulizerExample2.
  ///
  /// In en, this message translates to:
  /// **'Atrovent Nebules'**
  String get nebulizerExample2;

  /// No description provided for @nebulizerExample3.
  ///
  /// In en, this message translates to:
  /// **'Pulmicort Respules'**
  String get nebulizerExample3;

  /// No description provided for @nebulizerStep1.
  ///
  /// In en, this message translates to:
  /// **'Wash your hands.'**
  String get nebulizerStep1;

  /// No description provided for @nebulizerStep2.
  ///
  /// In en, this message translates to:
  /// **'Put the medicine into the nebulizer cup.'**
  String get nebulizerStep2;

  /// No description provided for @nebulizerStep3.
  ///
  /// In en, this message translates to:
  /// **'Attach the mask or mouthpiece.'**
  String get nebulizerStep3;

  /// No description provided for @nebulizerStep4.
  ///
  /// In en, this message translates to:
  /// **'Turn on the machine.'**
  String get nebulizerStep4;

  /// No description provided for @nebulizerStep5.
  ///
  /// In en, this message translates to:
  /// **'Breathe normally through the mouth until the mist stops (about 10–15 minutes).'**
  String get nebulizerStep5;

  /// No description provided for @nebulizerStep6.
  ///
  /// In en, this message translates to:
  /// **'Turn off the machine and clean the equipment after use.'**
  String get nebulizerStep6;

  /// No description provided for @dpiTitle.
  ///
  /// In en, this message translates to:
  /// **'Dry Powder Inhaler (DPI)'**
  String get dpiTitle;

  /// No description provided for @dpiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Breath-activated dry powder'**
  String get dpiSubtitle;

  /// No description provided for @dpiExample1.
  ///
  /// In en, this message translates to:
  /// **'Seretide Diskus'**
  String get dpiExample1;

  /// No description provided for @dpiExample2.
  ///
  /// In en, this message translates to:
  /// **'Ventolin Diskus'**
  String get dpiExample2;

  /// No description provided for @dpiExample3.
  ///
  /// In en, this message translates to:
  /// **'Inhalex'**
  String get dpiExample3;

  /// No description provided for @dpiStep1.
  ///
  /// In en, this message translates to:
  /// **'Load the dose.'**
  String get dpiStep1;

  /// No description provided for @dpiStep2.
  ///
  /// In en, this message translates to:
  /// **'Breathe out away from device.'**
  String get dpiStep2;

  /// No description provided for @dpiStep3.
  ///
  /// In en, this message translates to:
  /// **'Seal lips around mouthpiece.'**
  String get dpiStep3;

  /// No description provided for @dpiStep4.
  ///
  /// In en, this message translates to:
  /// **'Breathe in fast and deep.'**
  String get dpiStep4;

  /// No description provided for @dpiStep5.
  ///
  /// In en, this message translates to:
  /// **'Hold breath for 10 seconds.'**
  String get dpiStep5;

  /// No description provided for @dpiStep6.
  ///
  /// In en, this message translates to:
  /// **'Breathe out slowly.'**
  String get dpiStep6;

  /// No description provided for @pfmTitle.
  ///
  /// In en, this message translates to:
  /// **'Peak Flow Meter (PFM)'**
  String get pfmTitle;

  /// No description provided for @pfmSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Measures your lung air flow capacity'**
  String get pfmSubtitle;

  /// No description provided for @pfmExample1.
  ///
  /// In en, this message translates to:
  /// **'Mini Wright Peak Flow Meter'**
  String get pfmExample1;

  /// No description provided for @pfmExample2.
  ///
  /// In en, this message translates to:
  /// **'Microlife PF100 Peak Flow Meter'**
  String get pfmExample2;

  /// No description provided for @pfmStep1.
  ///
  /// In en, this message translates to:
  /// **'Stand up straight.'**
  String get pfmStep1;

  /// No description provided for @pfmStep2.
  ///
  /// In en, this message translates to:
  /// **'Move marker to zero.'**
  String get pfmStep2;

  /// No description provided for @pfmStep3.
  ///
  /// In en, this message translates to:
  /// **'Take a deep breath.'**
  String get pfmStep3;

  /// No description provided for @pfmStep4.
  ///
  /// In en, this message translates to:
  /// **'Blow out hard and fast.'**
  String get pfmStep4;

  /// No description provided for @pfmStep5.
  ///
  /// In en, this message translates to:
  /// **'Repeat 3 times.'**
  String get pfmStep5;

  /// No description provided for @pfmStep6.
  ///
  /// In en, this message translates to:
  /// **'Record the highest reading.'**
  String get pfmStep6;

  /// No description provided for @respimatTitle.
  ///
  /// In en, this message translates to:
  /// **'Respimat'**
  String get respimatTitle;

  /// No description provided for @respimatSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Generates a slow-moving soft mist'**
  String get respimatSubtitle;

  /// No description provided for @respimatExample1.
  ///
  /// In en, this message translates to:
  /// **'Spiriva Respimat'**
  String get respimatExample1;

  /// No description provided for @respimatExample2.
  ///
  /// In en, this message translates to:
  /// **'Combivent Respimat'**
  String get respimatExample2;

  /// No description provided for @respimatStep1.
  ///
  /// In en, this message translates to:
  /// **'Turn the base until it clicks.'**
  String get respimatStep1;

  /// No description provided for @respimatStep2.
  ///
  /// In en, this message translates to:
  /// **'Open the cap.'**
  String get respimatStep2;

  /// No description provided for @respimatStep3.
  ///
  /// In en, this message translates to:
  /// **'Breathe out slowly.'**
  String get respimatStep3;

  /// No description provided for @respimatStep4.
  ///
  /// In en, this message translates to:
  /// **'Press button while breathing in slowly and deeply.'**
  String get respimatStep4;

  /// No description provided for @respimatStep5.
  ///
  /// In en, this message translates to:
  /// **'Hold breath for 10 seconds.'**
  String get respimatStep5;

  /// No description provided for @spacerMaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Spacer and Mask'**
  String get spacerMaskTitle;

  /// No description provided for @spacerMaskSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Ideal for infants and young children'**
  String get spacerMaskSubtitle;

  /// No description provided for @spacerMaskExample1.
  ///
  /// In en, this message translates to:
  /// **'AeroChamber+ Mask'**
  String get spacerMaskExample1;

  /// No description provided for @spacerMaskExample2.
  ///
  /// In en, this message translates to:
  /// **'BabyHaler Spacer'**
  String get spacerMaskExample2;

  /// No description provided for @spacerMaskExample3.
  ///
  /// In en, this message translates to:
  /// **'Volumatic Spacer'**
  String get spacerMaskExample3;

  /// No description provided for @spacerMaskStep1.
  ///
  /// In en, this message translates to:
  /// **'Shake inhaler well.'**
  String get spacerMaskStep1;

  /// No description provided for @spacerMaskStep2.
  ///
  /// In en, this message translates to:
  /// **'Attach inhaler to spacer.'**
  String get spacerMaskStep2;

  /// No description provided for @spacerMaskStep3.
  ///
  /// In en, this message translates to:
  /// **'Place mask tightly on face.'**
  String get spacerMaskStep3;

  /// No description provided for @spacerMaskStep4.
  ///
  /// In en, this message translates to:
  /// **'Press one puff.'**
  String get spacerMaskStep4;

  /// No description provided for @spacerMaskStep5.
  ///
  /// In en, this message translates to:
  /// **'Let patient breathe normally 5–6 breaths.'**
  String get spacerMaskStep5;

  /// No description provided for @spacerMaskStep6.
  ///
  /// In en, this message translates to:
  /// **'Repeat if needed.'**
  String get spacerMaskStep6;

  /// No description provided for @turbuhalerTitle.
  ///
  /// In en, this message translates to:
  /// **'Turbuhaler'**
  String get turbuhalerTitle;

  /// No description provided for @turbuhalerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Inhale strongly and deeply'**
  String get turbuhalerSubtitle;

  /// No description provided for @turbuhalerExample1.
  ///
  /// In en, this message translates to:
  /// **'Symbicort Turbuhaler'**
  String get turbuhalerExample1;

  /// No description provided for @turbuhalerExample2.
  ///
  /// In en, this message translates to:
  /// **'Bricanyl Turbuhaler'**
  String get turbuhalerExample2;

  /// No description provided for @turbuhalerStep1.
  ///
  /// In en, this message translates to:
  /// **'Unscrew and remove cap.'**
  String get turbuhalerStep1;

  /// No description provided for @turbuhalerStep2.
  ///
  /// In en, this message translates to:
  /// **'Twist grip forward and back until click.'**
  String get turbuhalerStep2;

  /// No description provided for @turbuhalerStep3.
  ///
  /// In en, this message translates to:
  /// **'Breathe out away from inhaler.'**
  String get turbuhalerStep3;

  /// No description provided for @turbuhalerStep4.
  ///
  /// In en, this message translates to:
  /// **'Breathe in strongly and deeply.'**
  String get turbuhalerStep4;

  /// No description provided for @turbuhalerStep5.
  ///
  /// In en, this message translates to:
  /// **'Hold breath for 10 seconds.'**
  String get turbuhalerStep5;

  /// No description provided for @turbuhalerStep6.
  ///
  /// In en, this message translates to:
  /// **'Replace cap.'**
  String get turbuhalerStep6;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'PuffPal Login'**
  String get loginTitle;

  /// No description provided for @signupTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupTitle;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameHint;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneHint;

  /// No description provided for @ageHint.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get ageHint;

  /// No description provided for @genderHint.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get genderHint;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @signupButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signupButton;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get invalidEmail;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Minimum 6 characters'**
  String get passwordTooShort;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneRequired;

  /// No description provided for @phoneInvalidLength.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be exactly 11 digits'**
  String get phoneInvalidLength;

  /// No description provided for @ageRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your age'**
  String get ageRequired;

  /// No description provided for @ageInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid age (1-120)'**
  String get ageInvalid;

  /// No description provided for @genderRequired.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get genderRequired;

  /// No description provided for @loginFailedException.
  ///
  /// In en, this message translates to:
  /// **'Login failed: Invalid credentials'**
  String get loginFailedException;

  /// No description provided for @signupSuccessAlert.
  ///
  /// In en, this message translates to:
  /// **'Sign-up successful! Please login.'**
  String get signupSuccessAlert;

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @pocketAsthmaHelper.
  ///
  /// In en, this message translates to:
  /// **'Your pocket-sized asthma helper.'**
  String get pocketAsthmaHelper;

  /// No description provided for @asthmaCareSimple.
  ///
  /// In en, this message translates to:
  /// **'Asthma care made simple!'**
  String get asthmaCareSimple;

  /// No description provided for @asthmaCareDesc.
  ///
  /// In en, this message translates to:
  /// **'Track symptoms, learn helpful tips, and breathe with confidence.'**
  String get asthmaCareDesc;

  /// No description provided for @onboardingDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready to breathe easier?'**
  String get onboardingDoneTitle;

  /// No description provided for @onboardingDoneDesc.
  ///
  /// In en, this message translates to:
  /// **'Join PuffPal today and gain control over your asthma journey.'**
  String get onboardingDoneDesc;

  /// No description provided for @combinedQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'Inhalation Devices Master Quiz'**
  String get combinedQuizTitle;

  /// No description provided for @q_mdi_2.
  ///
  /// In en, this message translates to:
  /// **'What should you always do immediately after you finish using your inhaler?'**
  String get q_mdi_2;

  /// No description provided for @q_mdi_2_a.
  ///
  /// In en, this message translates to:
  /// **'Rinse your mouth out with water'**
  String get q_mdi_2_a;

  /// No description provided for @q_mdi_2_b.
  ///
  /// In en, this message translates to:
  /// **'Go to sleep'**
  String get q_mdi_2_b;

  /// No description provided for @q_mdi_2_c.
  ///
  /// In en, this message translates to:
  /// **'Eat a full meal'**
  String get q_mdi_2_c;

  /// No description provided for @q_mdi_2_d.
  ///
  /// In en, this message translates to:
  /// **'Exercise for 10 minutes'**
  String get q_mdi_2_d;

  /// No description provided for @q_spacer_adult_1.
  ///
  /// In en, this message translates to:
  /// **'What does it mean if you hear a whistle sound while breathing in from the spacer?'**
  String get q_spacer_adult_1;

  /// No description provided for @q_spacer_adult_1_a.
  ///
  /// In en, this message translates to:
  /// **'You are breathing in too fast.'**
  String get q_spacer_adult_1_a;

  /// No description provided for @q_spacer_adult_1_b.
  ///
  /// In en, this message translates to:
  /// **'You are holding your breath correctly.'**
  String get q_spacer_adult_1_b;

  /// No description provided for @q_spacer_adult_1_c.
  ///
  /// In en, this message translates to:
  /// **'The inhaler is completely empty.'**
  String get q_spacer_adult_1_c;

  /// No description provided for @q_spacer_adult_1_d.
  ///
  /// In en, this message translates to:
  /// **'You are breathing out instead of in.'**
  String get q_spacer_adult_1_d;

  /// No description provided for @q_spacer_adult_2.
  ///
  /// In en, this message translates to:
  /// **'What should you do if you are unable to hold your breath for 5 to 10 seconds after using the spacer?'**
  String get q_spacer_adult_2;

  /// No description provided for @q_spacer_adult_2_a.
  ///
  /// In en, this message translates to:
  /// **'Take 6 normal breaths from the spacer instead.'**
  String get q_spacer_adult_2_a;

  /// No description provided for @q_spacer_adult_2_b.
  ///
  /// In en, this message translates to:
  /// **'Stop using the inhaler entirely.'**
  String get q_spacer_adult_2_b;

  /// No description provided for @q_spacer_adult_2_c.
  ///
  /// In en, this message translates to:
  /// **'Spray another puff into the spacer immediately.'**
  String get q_spacer_adult_2_c;

  /// No description provided for @q_spacer_adult_2_d.
  ///
  /// In en, this message translates to:
  /// **'Take a drink of water instead.'**
  String get q_spacer_adult_2_d;

  /// No description provided for @q_spacer_child_1.
  ///
  /// In en, this message translates to:
  /// **'What does it mean if the dose counter on your inhaler says \'0\'?'**
  String get q_spacer_child_1;

  /// No description provided for @q_spacer_child_1_a.
  ///
  /// In en, this message translates to:
  /// **'The inhaler is empty and needs to be replaced.'**
  String get q_spacer_child_1_a;

  /// No description provided for @q_spacer_child_1_b.
  ///
  /// In en, this message translates to:
  /// **'The inhaler is perfectly ready to use.'**
  String get q_spacer_child_1_b;

  /// No description provided for @q_spacer_child_1_c.
  ///
  /// In en, this message translates to:
  /// **'The inhaler is exactly half full.'**
  String get q_spacer_child_1_c;

  /// No description provided for @q_spacer_child_1_d.
  ///
  /// In en, this message translates to:
  /// **'The inhaler needs to be shaken for 10 seconds.'**
  String get q_spacer_child_1_d;

  /// No description provided for @q_spacer_child_2.
  ///
  /// In en, this message translates to:
  /// **'What should you do to \'prime\' a brand new inhaler before using it for the very first time?'**
  String get q_spacer_child_2;

  /// No description provided for @q_spacer_child_2_a.
  ///
  /// In en, this message translates to:
  /// **'Shake it for 10 seconds and spray 2 to 4 puffs into the air.'**
  String get q_spacer_child_2_a;

  /// No description provided for @q_spacer_child_2_b.
  ///
  /// In en, this message translates to:
  /// **'Wash the entire inhaler with warm soap and water.'**
  String get q_spacer_child_2_b;

  /// No description provided for @q_spacer_child_2_c.
  ///
  /// In en, this message translates to:
  /// **'Put it in the refrigerator for 24 hours.'**
  String get q_spacer_child_2_c;

  /// No description provided for @q_spacer_child_2_d.
  ///
  /// In en, this message translates to:
  /// **'Press the button 10 times while keeping the cap tightly on.'**
  String get q_spacer_child_2_d;

  /// No description provided for @q_turbuhaler_1.
  ///
  /// In en, this message translates to:
  /// **'How should you hold the Turbuhaler when you are ready to use it, to make sure the medicine doesn\'t fall out?'**
  String get q_turbuhaler_1;

  /// No description provided for @q_turbuhaler_1_a.
  ///
  /// In en, this message translates to:
  /// **'Hold it flat (horizontally)'**
  String get q_turbuhaler_1_a;

  /// No description provided for @q_turbuhaler_1_b.
  ///
  /// In en, this message translates to:
  /// **'Hold it completely upside down.'**
  String get q_turbuhaler_1_b;

  /// No description provided for @q_turbuhaler_1_c.
  ///
  /// In en, this message translates to:
  /// **'Shake it up and down while breathing in.'**
  String get q_turbuhaler_1_c;

  /// No description provided for @q_turbuhaler_1_d.
  ///
  /// In en, this message translates to:
  /// **'Balance it vertically on a flat table.'**
  String get q_turbuhaler_1_d;

  /// No description provided for @q_turbuhaler_2.
  ///
  /// In en, this message translates to:
  /// **'If your doctor instructs you to take a second puff of your medication, how long should you wait after the first puff before repeating the steps?'**
  String get q_turbuhaler_2;

  /// No description provided for @q_turbuhaler_2_a.
  ///
  /// In en, this message translates to:
  /// **'About 1 minute'**
  String get q_turbuhaler_2_a;

  /// No description provided for @q_turbuhaler_2_b.
  ///
  /// In en, this message translates to:
  /// **'Right away with no pause'**
  String get q_turbuhaler_2_b;

  /// No description provided for @q_turbuhaler_2_c.
  ///
  /// In en, this message translates to:
  /// **'Exactly 1 hour'**
  String get q_turbuhaler_2_c;

  /// No description provided for @q_turbuhaler_2_d.
  ///
  /// In en, this message translates to:
  /// **'10 seconds'**
  String get q_turbuhaler_2_d;

  /// No description provided for @q_diskus_1.
  ///
  /// In en, this message translates to:
  /// **'How do you prepare a dose on your Diskus device and get it ready to inhale?'**
  String get q_diskus_1;

  /// No description provided for @q_diskus_1_a.
  ///
  /// In en, this message translates to:
  /// **'Push the thumb grip away from you until it clicks, then slide the lever away from the mouthpiece until it clicks again'**
  String get q_diskus_1_a;

  /// No description provided for @q_diskus_1_b.
  ///
  /// In en, this message translates to:
  /// **'Push the thumb grip away from you until you see the mouthpiece'**
  String get q_diskus_1_b;

  /// No description provided for @q_diskus_1_c.
  ///
  /// In en, this message translates to:
  /// **'Twist the entire gray base around'**
  String get q_diskus_1_c;

  /// No description provided for @q_diskus_1_d.
  ///
  /// In en, this message translates to:
  /// **'Press the center button until a light flashes.'**
  String get q_diskus_1_d;

  /// No description provided for @q_respimat_1.
  ///
  /// In en, this message translates to:
  /// **'When using your Respimat inhaler, what is the quick three-step memory trick (acronym) to help you remember the order of steps?'**
  String get q_respimat_1;

  /// No description provided for @q_respimat_1_a.
  ///
  /// In en, this message translates to:
  /// **'TOP (TURN - OPEN - PRESS)'**
  String get q_respimat_1_a;

  /// No description provided for @q_respimat_1_b.
  ///
  /// In en, this message translates to:
  /// **'PUSH - TURN - INHALE - COUNT'**
  String get q_respimat_1_b;

  /// No description provided for @q_respimat_1_c.
  ///
  /// In en, this message translates to:
  /// **'CLICK - SPIN - BREATHE - CLOSE'**
  String get q_respimat_1_c;

  /// No description provided for @q_respimat_1_d.
  ///
  /// In en, this message translates to:
  /// **'READY - SET - GO - REPEAT'**
  String get q_respimat_1_d;

  /// No description provided for @q_respimat_2.
  ///
  /// In en, this message translates to:
  /// **'How often should you clean the mouthpiece of your Respimat inhaler?'**
  String get q_respimat_2;

  /// No description provided for @q_respimat_2_a.
  ///
  /// In en, this message translates to:
  /// **'Once a week with a damp cloth.'**
  String get q_respimat_2_a;

  /// No description provided for @q_respimat_2_b.
  ///
  /// In en, this message translates to:
  /// **'After every single dose with soap and water.'**
  String get q_respimat_2_b;

  /// No description provided for @q_respimat_2_c.
  ///
  /// In en, this message translates to:
  /// **'Once a month with rubbing alcohol.'**
  String get q_respimat_2_c;

  /// No description provided for @q_respimat_2_d.
  ///
  /// In en, this message translates to:
  /// **'Only when it looks visually dirty.'**
  String get q_respimat_2_d;

  /// No description provided for @q_neb_2.
  ///
  /// In en, this message translates to:
  /// **'When putting your nebulizer parts together, how many pieces do you connect to form the complete setup?'**
  String get q_neb_2;

  /// No description provided for @q_neb_2_a.
  ///
  /// In en, this message translates to:
  /// **'5 pieces: medicine cup, top piece and mask, thin plastic tubing, and compressor'**
  String get q_neb_2_a;

  /// No description provided for @q_neb_2_b.
  ///
  /// In en, this message translates to:
  /// **'3 pieces: medicine cup, mouthpiece, and mask'**
  String get q_neb_2_b;

  /// No description provided for @q_neb_2_c.
  ///
  /// In en, this message translates to:
  /// **'4 pieces: medicine cup, top piece, mask, and electrical plug'**
  String get q_neb_2_c;

  /// No description provided for @q_neb_2_d.
  ///
  /// In en, this message translates to:
  /// **'6 pieces: medicine cup, top piece, mouthpiece, tubing, compressor, and carrying bag'**
  String get q_neb_2_d;

  /// No description provided for @q_peak_1.
  ///
  /// In en, this message translates to:
  /// **'When you repeat the test three times to find your score, which number should you write down in your daily diary?'**
  String get q_peak_1;

  /// No description provided for @q_peak_1_a.
  ///
  /// In en, this message translates to:
  /// **'The highest number you reached out of your three attempts.'**
  String get q_peak_1_a;

  /// No description provided for @q_peak_1_b.
  ///
  /// In en, this message translates to:
  /// **'The lowest number you got out of the three tries.'**
  String get q_peak_1_b;

  /// No description provided for @q_peak_1_c.
  ///
  /// In en, this message translates to:
  /// **'An average of all three numbers added together.'**
  String get q_peak_1_c;

  /// No description provided for @q_peak_1_d.
  ///
  /// In en, this message translates to:
  /// **'The number from your very first try.'**
  String get q_peak_1_d;

  /// No description provided for @q_peak_2.
  ///
  /// In en, this message translates to:
  /// **'How long should you keep a daily record of your peak flow score?'**
  String get q_peak_2;

  /// No description provided for @q_peak_2_a.
  ///
  /// In en, this message translates to:
  /// **'For 2 weeks at around the same time.'**
  String get q_peak_2_a;

  /// No description provided for @q_peak_2_b.
  ///
  /// In en, this message translates to:
  /// **'Just 2 or 3 days in a row.'**
  String get q_peak_2_b;

  /// No description provided for @q_peak_2_c.
  ///
  /// In en, this message translates to:
  /// **'Only on the weekends for 1 month.'**
  String get q_peak_2_c;

  /// No description provided for @q_peak_2_d.
  ///
  /// In en, this message translates to:
  /// **'For a full calendar year without stopping.'**
  String get q_peak_2_d;

  /// No description provided for @q_peak_3.
  ///
  /// In en, this message translates to:
  /// **'What is your \'personal best\' peak flow number, and how is it determined?'**
  String get q_peak_3;

  /// No description provided for @q_peak_3_a.
  ///
  /// In en, this message translates to:
  /// **'It is the highest number you reach during a two-week tracking period while you are feeling well.'**
  String get q_peak_3_a;

  /// No description provided for @q_peak_3_b.
  ///
  /// In en, this message translates to:
  /// **'It is the lowest score you get when you are feeling very sick.'**
  String get q_peak_3_b;

  /// No description provided for @q_peak_3_c.
  ///
  /// In en, this message translates to:
  /// **'It is the average score calculated by your doctor during an appointment.'**
  String get q_peak_3_c;

  /// No description provided for @q_peak_3_d.
  ///
  /// In en, this message translates to:
  /// **'It is a standard number that is exactly the same for every person.'**
  String get q_peak_3_d;
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
