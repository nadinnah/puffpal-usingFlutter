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
  /// **'Advice of the Day'**
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
