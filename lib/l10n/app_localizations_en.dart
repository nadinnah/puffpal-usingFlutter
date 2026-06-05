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
  String get logitLearnItControlIt => 'Log it, Learn it, Control it';

  @override
  String get breatheBetter => 'Breathe Better, learn More';

  @override
  String get quizzesTitle => 'Quizzes and Games';

  @override
  String get setReminder => 'Set Reminder';

  @override
  String get medicationReminders => 'Medication Reminders';

  @override
  String get advice_title => 'Advice of the Day!';

  @override
  String get asthmaBasicsTitle => 'Asthma Basics';

  @override
  String get understandingAsthma => 'Understanding Asthma';

  @override
  String get asthmaHeaderDescription =>
      'Think of your airways as roads. Asthma causes traffic jams by making them swollen, narrow, and filled with mucus.';

  @override
  String get asthmaBasicsSection => 'Asthma Basics';

  @override
  String get asthmaFact1 => 'Asthma is a chronic condition.';

  @override
  String get asthmaFact2 => 'You live with it every day.';

  @override
  String get asthmaFact3 => 'It can be serious and even life-threatening.';

  @override
  String get asthmaFact4 =>
      'There is no cure, but it can be managed successfully.';

  @override
  String get whatHappensTitle => 'What Happens During Asthma?';

  @override
  String get airwaySwollen => 'Airways become swollen';

  @override
  String get musclesTighten => 'Muscles tighten around them';

  @override
  String get moreMucus => 'More mucus forms';

  @override
  String get airwaysNarrow => 'Airways become narrow';

  @override
  String get commonSymptoms => 'Common Symptoms';

  @override
  String get cough => 'Cough';

  @override
  String get wheezing => 'Wheezing';

  @override
  String get chestTightness => 'Chest Tightness';

  @override
  String get shortnessBreath => 'Shortness of Breath';

  @override
  String get typesOfAsthma => 'Types of Asthma';

  @override
  String get viewAsthmaTypes => 'View Asthma Types';

  @override
  String get allergicAsthma => 'Allergic Asthma';

  @override
  String get aspirinAsthma => 'Aspirin-Induced Asthma';

  @override
  String get coughVariantAsthma => 'Cough-Variant Asthma';

  @override
  String get exerciseAsthma => 'Exercise-Induced Asthma';

  @override
  String get nighttimeAsthma => 'Nighttime Asthma';

  @override
  String get steroidAsthma => 'Steroid-Resistant Asthma';

  @override
  String get occupationalAsthma => 'Occupational Asthma';

  @override
  String get dailyManagementTips => 'Daily Management Tips';

  @override
  String get tip1 => 'Take medications exactly as prescribed';

  @override
  String get tip2 => 'Carry your rescue inhaler';

  @override
  String get tip3 => 'Avoid smoke, dust, and pollution';

  @override
  String get tip4 => 'Keep your home clean and well ventilated';

  @override
  String get tip5 => 'Wash bedding regularly';

  @override
  String get tip6 => 'Stay active with approved exercise';

  @override
  String get tip7 => 'Warm up before exercise';

  @override
  String get tip8 => 'Drink enough water';

  @override
  String get tip9 => 'Manage stress';

  @override
  String get tip10 => 'Get enough sleep';

  @override
  String get tip11 => 'Avoid smoking and secondhand smoke';

  @override
  String get tip12 => 'Get recommended vaccines';

  @override
  String get tip13 => 'Monitor symptoms';

  @override
  String get tip14 => 'Follow your asthma action plan';

  @override
  String get knowYourInhalers => 'Know Your Inhalers';

  @override
  String get reliever => 'Reliever';

  @override
  String get relieverDescription =>
      'Works fast during symptoms or before exercise.';

  @override
  String get controller => 'Controller';

  @override
  String get controllerDescription => 'Used every day to prevent attacks.';

  @override
  String get quickReminder => 'Quick Reminder';

  @override
  String get medicationRemindersTitle => 'Medication Reminders';

  @override
  String get medicationRemindersSubtitle =>
      'Set the start time and how often to repeat for each medicine.';

  @override
  String get maxMedicationsError => 'Maximum 5 medications allowed';

  @override
  String enterMedicineLabel(int index) {
    return 'Enter Medicine $index';
  }

  @override
  String get firstDose => 'First Dose';

  @override
  String get everyIntervalLabel => 'Every';

  @override
  String hoursValue(int hours) {
    return '$hours hrs';
  }

  @override
  String get addAnotherMedication => 'Add Another Medication';

  @override
  String get fillAllDetailsError => 'Please fill all details.';

  @override
  String get remindersSavedMessage => 'Reminders saved and active!';

  @override
  String get setTimersButton => 'Set Timers';

  @override
  String get activeRemindersTitle => 'Active Reminders';

  @override
  String get noActiveReminders => 'No active reminders.';

  @override
  String reminderRemovedMessage(String name) {
    return '$name reminder removed';
  }

  @override
  String get undoAction => 'Undo';

  @override
  String get reminderRestoredMessage => 'Reminder restored';

  @override
  String reminderSubtitleInfo(String time, int hours) {
    return 'Started at $time • Every ${hours}h';
  }

  @override
  String editFieldTitle(String label) {
    return 'Edit $label';
  }

  @override
  String get cancelAction => 'Cancel';

  @override
  String get saveAction => 'Save';

  @override
  String get medicationRemindersMenu => 'Medication Reminders';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get carouselBasicsTitle => 'Asthma Basics';

  @override
  String get carouselBasicsSubtitle =>
      'Learn the basics of asthma and its symptoms.';

  @override
  String get carouselTriggersTitle => 'Asthma Triggers';

  @override
  String get carouselTriggersSubtitle =>
      'Identify and minimize daily irritants to keep your lungs healthy.';

  @override
  String get carouselHelpTitle => 'When to Seek Help';

  @override
  String get carouselHelpSubtitle =>
      'Learn the warning signs of worsening asthma and when to seek care.';

  @override
  String get carouselInhalerTitle => 'Inhaler Techniques';

  @override
  String get carouselInhalerSubtitle =>
      'Master your proper inhaler usage step-by-step for better relief.';

  @override
  String get trackedTodayTitle => 'You\'re all set for today!';

  @override
  String get trackedTodaySubtitle => 'Tap a square to see past data';

  @override
  String get backToHome => 'Back to Home';

  @override
  String questionProgress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get yesLabel => 'Yes';

  @override
  String get noLabel => 'No';

  @override
  String get backButton => 'Back';

  @override
  String get nextButton => 'Next';

  @override
  String get submitButton => 'Submit';

  @override
  String get assessmentResultTitle => 'Assessment Result';

  @override
  String logDateTitle(int day, int month, int year) {
    return 'Log: $day/$month/$year';
  }

  @override
  String get okAction => 'OK';

  @override
  String get wellControlledAsthma => 'Well Controlled Asthma';

  @override
  String get partlyControlledAsthma => 'Partly Controlled Asthma';

  @override
  String get uncontrolledAsthma => 'Uncontrolled Asthma';

  @override
  String get questionDaytime => 'Daytime symptoms more than twice/week?';

  @override
  String get questionNightWaking => 'Any night waking due to asthma?';

  @override
  String get questionRescueInhaler =>
      'Rescue inhaler needed more than twice/week?';

  @override
  String get questionActivityLimitation =>
      'Any activity limitation due to asthma?';

  @override
  String get reminderText =>
      'Feeling well? Take your Controller as prescribed.\n\nStarting to cough, wheeze, or feel tight-chested?\nUse your Reliever and follow your asthma action plan.';

  @override
  String get pdfTitle => 'Asthma Action Plan';

  @override
  String get openPdf => 'Open PDF';

  @override
  String get quizCompleted => 'Quiz Completed!';

  @override
  String scoreMessage(int score, int total) {
    return 'Your score is $score out of $total';
  }

  @override
  String numberOfQuestions(int count) {
    return '$count questions';
  }

  @override
  String quizScoreDisplay(int score, int total) {
    return 'Score: $score/$total';
  }

  @override
  String get quiz1Title => 'Asthma Basics Adventure';

  @override
  String get q1_1 => 'Asthma affects which part of the body?';

  @override
  String get q1_1_a => 'Airways';

  @override
  String get q1_1_b => 'Stomach';

  @override
  String get q1_1_c => 'Bones';

  @override
  String get q1_1_d => 'Skin';

  @override
  String get q1_2 =>
      'In the “traffic jam” example, what causes the roads (airways) to become crowded?';

  @override
  String get q1_2_a => 'Mucus and swelling';

  @override
  String get q1_2_b => 'Extra oxygen';

  @override
  String get q1_2_c => 'More blood flow';

  @override
  String get q1_2_d => 'Water';

  @override
  String get q1_3 => 'Asthma is described as:';

  @override
  String get q1_3_a => 'A chronic condition';

  @override
  String get q1_3_b => 'A short-term illness';

  @override
  String get q1_3_c => 'A broken bone';

  @override
  String get q1_3_d => 'An infection';

  @override
  String get q1_4 => 'Which statement about asthma is TRUE?';

  @override
  String get q1_4_a => 'There is no cure, but it can be controlled';

  @override
  String get q1_4_b => 'It always goes away on its own';

  @override
  String get q1_4_b2 => 'It cannot be managed';

  @override
  String get q1_4_c => 'Only children get asthma';

  @override
  String get q1_5 =>
      'What happens to the muscles around the airways during an asthma flare?';

  @override
  String get q1_5_a => 'They tighten';

  @override
  String get q1_5_b => 'They relax completely';

  @override
  String get q1_5_c => 'They disappear';

  @override
  String get q1_5_d => 'They grow larger';

  @override
  String get q1_6 => 'Which of these is NOT a common asthma symptom?';

  @override
  String get q1_6_a => 'Toothache';

  @override
  String get q1_6_b => 'Wheezing';

  @override
  String get q1_6_c => 'Chest tightness';

  @override
  String get q1_6_d => 'Shortness of breath';

  @override
  String get q1_7 => 'What happens to the airways during asthma?';

  @override
  String get q1_7_a => 'They become narrower';

  @override
  String get q1_7_b => 'They become wider';

  @override
  String get q1_7_c => 'They turn blue';

  @override
  String get q1_7_d => 'They stop working forever';

  @override
  String get q1_8 => 'Which of the following can happen during asthma?';

  @override
  String get q1_8_a => 'More mucus forms';

  @override
  String get q1_8_b => 'Hair grows faster';

  @override
  String get q1_8_c => 'Vision improves';

  @override
  String get q1_8_d => 'Bones weaken';

  @override
  String get q1_9 => 'Which symptom may make breathing feel harder?';

  @override
  String get q1_9_a => 'All of the above';

  @override
  String get q1_9_b => 'Wheezing';

  @override
  String get q1_9_c => 'Shortness of breath';

  @override
  String get q1_9_d => 'Chest tightness';

  @override
  String get q1_10 => 'Asthma can be:';

  @override
  String get q1_10_a => 'Serious and life-threatening';

  @override
  String get q1_10_b => 'Always harmless';

  @override
  String get q1_10_c => 'Contagious';

  @override
  String get q1_10_d => 'Caused by eating candy';

  @override
  String get quiz2Title => 'Asthma Hero Challenge';

  @override
  String get q2_1 =>
      'Which asthma type may happen during or after physical activity?';

  @override
  String get q2_1_a => 'Exercise-induced asthma';

  @override
  String get q2_1_b => 'Nighttime asthma';

  @override
  String get q2_1_c => 'Occupational asthma';

  @override
  String get q2_1_d => 'Allergic asthma';

  @override
  String get q2_2 => 'What should you always carry with you?';

  @override
  String get q2_2_a => 'Rescue inhaler';

  @override
  String get q2_2_b => 'Sunglasses';

  @override
  String get q2_2_c => 'Water bottle';

  @override
  String get q2_2_d => 'Umbrella';

  @override
  String get q2_3 => 'Which of these can trigger asthma symptoms?';

  @override
  String get q2_3_a => 'All of the above';

  @override
  String get q2_3_b => 'Smoke';

  @override
  String get q2_3_c => 'Dust';

  @override
  String get q2_3_d => 'Strong perfumes';

  @override
  String get q2_4 => 'What is the main job of the Reliever (“Rescue Hero”)?';

  @override
  String get q2_4_a => 'Open the airways quickly';

  @override
  String get q2_4_b => 'Prevent attacks for months';

  @override
  String get q2_4_c => 'Cure asthma forever';

  @override
  String get q2_4_d => 'Help you sleep';

  @override
  String get q2_5 => 'When should you use the Controller (“Bodyguard”)?';

  @override
  String get q2_5_a => 'Every day as prescribed';

  @override
  String get q2_5_b => 'Only during an attack';

  @override
  String get q2_5_c => 'Only when exercising';

  @override
  String get q2_5_d => 'Once a month';

  @override
  String get q2_6 => 'Which statement about the Controller is TRUE?';

  @override
  String get q2_6_a => 'It reduces swelling and helps prevent attacks';

  @override
  String get q2_6_b => 'It works instantly';

  @override
  String get q2_6_c => 'It is only for emergencies';

  @override
  String get q2_6_d => 'It replaces the reliever inhaler';

  @override
  String get q2_7 =>
      'What should you do if you start coughing, wheezing, or feel chest tightness?';

  @override
  String get q2_7_a => 'Use your Reliever and follow your action plan';

  @override
  String get q2_7_b => 'Ignore it';

  @override
  String get q2_7_c => 'Drink juice only';

  @override
  String get q2_7_d => 'Stop breathing deeply';

  @override
  String get q2_8 => 'Which daily habit can help control asthma?';

  @override
  String get q2_8_a => 'Following your asthma action plan';

  @override
  String get q2_8_b => 'Smoking';

  @override
  String get q2_8_c => 'Skipping medications';

  @override
  String get q2_8_d => 'Avoiding all exercise forever';

  @override
  String get q2_9 => 'Why is washing bedding regularly helpful?';

  @override
  String get q2_9_a => 'Reduces dust and allergens';

  @override
  String get q2_9_b => 'Makes the bed softer';

  @override
  String get q2_9_c => 'Changes the color';

  @override
  String get q2_9_d => 'Prevents wrinkles';

  @override
  String get q2_10 => 'Which habit is BEST for healthy lungs?';

  @override
  String get q2_10_a => 'Avoiding secondhand smoke';

  @override
  String get q2_10_b => 'Smoking occasionally';

  @override
  String get q2_10_c => 'Skipping sleep';

  @override
  String get q2_10_d => 'Ignoring symptoms';

  @override
  String get quiz3Title => 'Doctor Visit or Not?';

  @override
  String get q3_1 =>
      'You wake up coughing and wheezing several nights this week. What should you do?';

  @override
  String get q3_1_a => 'Tell your doctor';

  @override
  String get q3_1_b => 'Ignore it';

  @override
  String get q3_1_c => 'Wait a month';

  @override
  String get q3_1_d => 'Stop all medications';

  @override
  String get q3_2 =>
      'Your rescue inhaler is helping less than usual. What does this mean?';

  @override
  String get q3_2_a => 'Your asthma may be worsening';

  @override
  String get q3_2_b => 'Everything is fine';

  @override
  String get q3_2_c => 'You need more coffee';

  @override
  String get q3_2_d => 'Exercise harder';

  @override
  String get q3_3 =>
      'Asthma keeps stopping you from exercising and playing with friends. What should you do?';

  @override
  String get q3_3_a => 'See your doctor for advice';

  @override
  String get q3_3_b => 'Quit all activities forever';

  @override
  String get q3_3_c => 'Ignore it';

  @override
  String get q3_3_d => 'Throw away your inhaler';

  @override
  String get q3_4 =>
      'Your peak flow readings are lower than usual for several days. What’s the best action?';

  @override
  String get q3_4_a => 'Discuss it with your doctor';

  @override
  String get q3_4_b => 'Celebrate';

  @override
  String get q3_4_c => 'Ignore them';

  @override
  String get q3_4_d => 'Stop measuring';

  @override
  String get q3_5 =>
      'You notice side effects after starting a new asthma medication. What should you do?';

  @override
  String get q3_5_a => 'See your doctor';

  @override
  String get q3_5_b => 'Double the dose';

  @override
  String get q3_5_c => 'Ignore them';

  @override
  String get q3_5_d => 'Stop all treatment without advice';

  @override
  String get q3_6 =>
      'You have asthma and develop fever with colored mucus. What should you do?';

  @override
  String get q3_6_a => 'See your doctor';

  @override
  String get q3_6_b => 'Wait until next year';

  @override
  String get q3_6_c => 'Ignore it';

  @override
  String get q3_6_d => 'Exercise more';

  @override
  String get q3_7 =>
      'This is your first-ever episode of wheezing. What should you do?';

  @override
  String get q3_7_a => 'See a healthcare professional';

  @override
  String get q3_7_b => 'Ignore it';

  @override
  String get q3_7_c => 'Assume it is normal';

  @override
  String get q3_7_d => 'Take random medicine';

  @override
  String get q3_8 =>
      'You needed emergency treatment twice this year for asthma. What does this suggest?';

  @override
  String get q3_8_a => 'Your asthma should be reviewed by a doctor';

  @override
  String get q3_8_b => 'Everything is controlled';

  @override
  String get q3_8_c => 'Stop follow-up visits';

  @override
  String get q3_8_d => 'Asthma is gone';

  @override
  String get q3_9 =>
      'Pregnancy is making asthma symptoms harder to control. What should you do?';

  @override
  String get q3_9_a => 'See your doctor';

  @override
  String get q3_9_b => 'Stop all asthma medicines';

  @override
  String get q3_9_c => 'Ignore symptoms';

  @override
  String get q3_9_d => 'Only drink water';

  @override
  String get q3_10 =>
      'Which situation is a reason to schedule a medical review?';

  @override
  String get q3_10_a => 'Symptoms becoming more frequent';

  @override
  String get q3_10_b => 'Feeling well-controlled';

  @override
  String get q3_10_c => 'Having no symptoms';

  @override
  String get q3_10_d => 'Following your treatment plan successfully';

  @override
  String get quiz4Title => 'Emergency or Not?';

  @override
  String get q4_1 =>
      'You are so short of breath that breathing feels very difficult. What should you do?';

  @override
  String get q4_1_a => 'Go to the Emergency Room immediately';

  @override
  String get q4_1_b => 'Take a nap';

  @override
  String get q4_1_c => 'Wait until tomorrow';

  @override
  String get q4_1_d => 'Ignore it';

  @override
  String get q4_2 =>
      'You can only speak a few words at a time because of breathing trouble. This is:';

  @override
  String get q4_2_a => 'An emergency';

  @override
  String get q4_2_b => 'Normal asthma';

  @override
  String get q4_2_c => 'A sign of being tired';

  @override
  String get q4_2_d => 'Nothing serious';

  @override
  String get q4_3 =>
      'Your rescue inhaler provides little or no relief. What should you do?';

  @override
  String get q4_3_a => 'Check Asthma action plan to know exactly what to do';

  @override
  String get q4_3_b => 'Ignore it';

  @override
  String get q4_3_c => 'Wait several days';

  @override
  String get q4_3_d => 'Stop breathing exercises forever';

  @override
  String get q4_4 => 'Your lips are turning blue or gray. What does this mean?';

  @override
  String get q4_4_a => 'Emergency—seek help now';

  @override
  String get q4_4_b => 'Normal asthma';

  @override
  String get q4_4_c => 'You’re cold';

  @override
  String get q4_4_d => 'You need water';

  @override
  String get q4_5 =>
      'Your coughing and wheezing are getting worse very quickly. What should you do?';

  @override
  String get q4_5_a => 'Emergency care is needed';

  @override
  String get q4_5_b => 'Ignore it';

  @override
  String get q4_5_c => 'Go jogging';

  @override
  String get q4_5_d => 'Stop monitoring symptoms';

  @override
  String get q4_6 =>
      'Chest tightness continues even after using your rescue inhaler. What should you do?';

  @override
  String get q4_6_a => 'Seek emergency help';

  @override
  String get q4_6_b => 'Wait a week';

  @override
  String get q4_6_c => 'Ignore it';

  @override
  String get q4_6_d => 'Stop treatment';

  @override
  String get q4_7 => 'Which sign is especially dangerous?';

  @override
  String get q4_7_a => 'Silent chest (very little air movement)';

  @override
  String get q4_7_b => 'Sneezing';

  @override
  String get q4_7_c => 'Hiccups';

  @override
  String get q4_7_d => 'Mild headache';

  @override
  String get q4_8 =>
      'You feel dizzy, confused, and extremely tired during an asthma attack. What should you do?';

  @override
  String get q4_8_a => 'Seek emergency help immediately';

  @override
  String get q4_8_b => 'Take a selfie';

  @override
  String get q4_8_c => 'Ignore it';

  @override
  String get q4_8_d => 'Wait until bedtime';

  @override
  String get q4_9 =>
      'Your symptoms keep worsening despite treatment. What does this mean?';

  @override
  String get q4_9_a => 'Emergency evaluation is needed';

  @override
  String get q4_9_b => 'Treatment is working';

  @override
  String get q4_9_c => 'Asthma is improving';

  @override
  String get q4_9_d => 'Nothing is wrong';

  @override
  String get q4_10 => 'Which of these is an asthma emergency?';

  @override
  String get q4_10_a => 'Confusion or drowsiness during an attack';

  @override
  String get q4_10_b => 'Controlled symptoms';

  @override
  String get q4_10_c => 'Feeling energetic';

  @override
  String get q4_10_d => 'Having a good peak flow reading';

  @override
  String get quizTriggersPart1Title => 'Asthma Triggers: Home & Environment';

  @override
  String get quizTriggersPart2Title => 'Asthma Triggers: Lifestyle & Health';

  @override
  String get quizInhalersPart1Title => 'Inhalers: Controller vs. Reliever';

  @override
  String get quizInhalersPart2Title => 'Inhalers: Setup & Best Practices';

  @override
  String get t1_1 =>
      'Which of the following types of smoke should an asthma patient avoid?';

  @override
  String get t1_1_a => 'Cigarette smoke, shisha, vaping, and burning odors';

  @override
  String get t1_1_b => 'Cigarette smoke only';

  @override
  String get t1_1_c => 'Shisha and vaping only';

  @override
  String get t1_1_d => 'Only outdoor smoke';

  @override
  String get t1_2 =>
      'What is recommended to decrease dust mites in an asthma patient\'s bed?';

  @override
  String get t1_2_a => 'Using mattress and pillow covers';

  @override
  String get t1_2_b => 'Changing the bed frame';

  @override
  String get t1_2_c => 'Sleeping without pillows';

  @override
  String get t1_2_d => 'Keeping the window open all night';

  @override
  String get t1_3 =>
      'Which of the following household habits helps reduce environmental allergens for asthma patients?';

  @override
  String get t1_3_a => 'Keeping the home clean and well-ventilated';

  @override
  String get t1_3_b => 'Keeping the home closed off and unventilated';

  @override
  String get t1_3_c => 'Sweeping dust into the air';

  @override
  String get t1_3_d => 'Using multiple air fresheners';

  @override
  String get t1_4 =>
      'Which annual vaccine should an asthma patient consider to prevent symptom-worsening infections?';

  @override
  String get t1_4_a => 'Yearly flu vaccine';

  @override
  String get t1_4_b => 'Tetanus vaccine';

  @override
  String get t1_4_c => 'Hepatitis vaccine';

  @override
  String get t1_4_d => 'Chickenpox vaccine';

  @override
  String get t1_5 =>
      'If exercise triggers asthma symptoms, what should a patient do if advised by their doctor?';

  @override
  String get t1_5_a => 'Use their prescribed inhaler before exercise';

  @override
  String get t1_5_b => 'Stop exercising completely';

  @override
  String get t1_5_c => 'Exercise only in freezing weather';

  @override
  String get t1_5_d => 'Drink a sugary beverage before running';

  @override
  String get t1_6 =>
      'Which over-the-counter pain medication is explicitly listed as a potential asthma trigger?';

  @override
  String get t1_6_a => 'Ibuprofen (an NSAID)';

  @override
  String get t1_6_b => 'Acetaminophen';

  @override
  String get t1_6_c => 'Vitamin C';

  @override
  String get t1_6_d => 'Antacids';

  @override
  String get t1_7 =>
      'Besides aspirin and NSAIDs, which class of medications is mentioned as a potential asthma trigger?';

  @override
  String get t1_7_a => 'Beta-blockers';

  @override
  String get t1_7_b => 'Antibiotics';

  @override
  String get t1_7_c => 'Antihistamines';

  @override
  String get t1_7_d => 'Cough syrups';

  @override
  String get t1_8 =>
      'What simple hygiene habit is recommended to help prevent respiratory infections like the flu or colds?';

  @override
  String get t1_8_a => 'Washing hands regularly';

  @override
  String get t1_8_b => 'Wearing heavy perfume';

  @override
  String get t1_8_c => 'Avoiding the use of mattress covers';

  @override
  String get t1_8_d => 'Exercising without using an inhaler';

  @override
  String get t1_9 =>
      'Besides smoke and dust, what other air conditions are listed as a \"bad air day\" trigger?';

  @override
  String get t1_9_a => 'Pollution and sandstorms';

  @override
  String get t1_9_b => 'High oxygen levels';

  @override
  String get t1_9_c => 'Fog and morning dew';

  @override
  String get t1_9_d => 'Gentle summer breezes';

  @override
  String get t1_10 =>
      'How can physical activity or \"running like you\'re in the Olympics\" affect some asthma patients?';

  @override
  String get t1_10_a => 'It acts as a trigger for asthma symptoms.';

  @override
  String get t1_10_b => 'It always cures asthma symptoms permanently.';

  @override
  String get t1_10_c => 'It prevents the need for a rescue inhaler.';

  @override
  String get t1_10_d => 'It eliminates the effect of pollen.';

  @override
  String get t2_1 =>
      'Which of the following sets of medications contains known triggers for some individuals with asthma?';

  @override
  String get t2_1_a => 'Aspirin, Ibuprofen (NSAIDs), and certain beta-blockers';

  @override
  String get t2_1_b => 'Vitamins and minerals';

  @override
  String get t2_1_c => 'Antibiotics and cough syrups';

  @override
  String get t2_1_d => 'Antacids and anti-allergy pills';

  @override
  String get t2_2 =>
      'What can happen to an asthma patient who is around someone smoking a shisha or vaping?';

  @override
  String get t2_2_a => 'Their asthma symptoms can get worse.';

  @override
  String get t2_2_b => 'Their lungs become completely immune to dust.';

  @override
  String get t2_2_c => 'They will no longer need a rescue inhaler.';

  @override
  String get t2_2_d => 'Their exercise performance will improve';

  @override
  String get t2_3 =>
      'What type of household spray can act as a trigger and cause an asthma attack?';

  @override
  String get t2_3_a => 'Chemical cleaning sprays';

  @override
  String get t2_3_b => 'Water mist spray';

  @override
  String get t2_3_c => 'Saline nasal sprays';

  @override
  String get t2_3_d => 'Air cooling fans';

  @override
  String get t2_4 =>
      'What outdoor trigger comes from trees, grass, and flowers?';

  @override
  String get t2_4_a => 'Pollen';

  @override
  String get t2_4_b => 'Dust bunnies';

  @override
  String get t2_4_c => 'Chemical fumes';

  @override
  String get t2_4_d => 'Pet dander';

  @override
  String get t2_5 => 'Why should an asthma patient wash their hands regularly?';

  @override
  String get t2_5_a =>
      'To avoid catching a cold or flu that could worsen asthma';

  @override
  String get t2_5_b => 'To remove pollen from their mattress covers';

  @override
  String get t2_5_c => 'To protect themselves from cold weather air';

  @override
  String get t2_5_d => 'To stop the effects of emotional stress';

  @override
  String get t2_6 =>
      'Which of the following describes an indoor environmental trigger found on carpets and furniture?';

  @override
  String get t2_6_a => 'Dust and dust mites';

  @override
  String get t2_6_b => 'Shisha smoke';

  @override
  String get t2_6_c => 'Sandstorms';

  @override
  String get t2_6_d => 'Pollen from outdoor trees';

  @override
  String get t2_7 =>
      'What can happen if an asthma patient breathes in chemical fumes from strong products?';

  @override
  String get t2_7_a => 'It can act as a trigger and worsen their asthma.';

  @override
  String get t2_7_b => 'Their breathing may become easier.';

  @override
  String get t2_7_c => 'It cures their allergy to pet dander.';

  @override
  String get t2_7_d => 'It replaces the need for a controller medicine.';

  @override
  String get t2_8 => 'What is pet dander, which is a known asthma trigger?';

  @override
  String get t2_8_a => 'Tiny bits of skin and fur from furry animals';

  @override
  String get t2_8_b => 'A type of medicine used for pain relief';

  @override
  String get t2_8_c => 'The chilly air found during winter';

  @override
  String get t2_8_d => 'A cleaning spray used for the kitchen';

  @override
  String get t2_9 =>
      'If someone with asthma wants to minimize triggers in their bedroom, what is the best habit?';

  @override
  String get t2_9_a => 'Use mattress and pillow covers to decrease dust mites.';

  @override
  String get t2_9_b => 'Avoid using any covers on pillows and mattresses.';

  @override
  String get t2_9_c => 'Keep the room unventilated and dusty.';

  @override
  String get t2_9_d => 'Bring multiple furry pets into the bed.';

  @override
  String get t2_10 =>
      'If an asthma patient loves playing with cats or dogs, what specific trigger should they watch out for?';

  @override
  String get t2_10_a => 'Pet dander';

  @override
  String get t2_10_b => 'Pollen party';

  @override
  String get t2_10_c => 'Burning odors';

  @override
  String get t2_10_d => 'Chemical fumes';

  @override
  String get i1_1 => 'What is the main purpose of a Controller inhaler?';

  @override
  String get i1_1_a =>
      'To prevent symptoms and asthma attacks by being used every day';

  @override
  String get i1_1_b => 'To give instant relief during an asthma attack';

  @override
  String get i1_1_c => 'To open the airways within seconds during an emergency';

  @override
  String get i1_1_d => 'To clean the lungs after a workout';

  @override
  String get i1_2 => 'How does a Controller inhaler help the lungs over time?';

  @override
  String get i1_2_a => 'It reduces swelling and inflammation in the airways';

  @override
  String get i1_2_b => 'It increases the patient\'s heart rate';

  @override
  String get i1_2_c => 'It cures asthma completely after one use';

  @override
  String get i1_2_d => 'It acts as a temporary mask for dust';

  @override
  String get i1_3 => 'When should a patient take their Controller inhaler?';

  @override
  String get i1_3_a => 'Regularly every day, even when feeling well';

  @override
  String get i1_3_b => 'Only when they are coughing severely';

  @override
  String get i1_3_c => 'Only during an emergency or sudden attack';

  @override
  String get i1_3_d => 'Only right before going to sleep';

  @override
  String get i1_4 =>
      'Does a Controller inhaler provide quick relief during sudden breathing problems?';

  @override
  String get i1_4_a =>
      'No, it does not give quick relief during sudden breathing problems';

  @override
  String get i1_4_b => 'Yes, it works instantly';

  @override
  String get i1_4_c => 'Yes, but only if taken with hot water';

  @override
  String get i1_4_d => 'No, it only works if you are exercising';

  @override
  String get i1_5 =>
      'Which type of inhaler is referred to as \"emergency help\" or \"The Rescue Inhaler\"?';

  @override
  String get i1_5_a => 'The Reliever inhaler';

  @override
  String get i1_5_b => 'The Controller inhaler';

  @override
  String get i1_5_c => 'The Nebulizer machine';

  @override
  String get i1_5_d => 'The Spacer attachment';

  @override
  String get i1_6 => 'What is the primary job of a Reliever inhaler?';

  @override
  String get i1_6_a => 'To work quickly to open the airways during symptoms';

  @override
  String get i1_6_b => 'To reduce swelling quietly over several weeks';

  @override
  String get i1_6_c => 'To replace the need for daily medication';

  @override
  String get i1_6_d => 'To track the patient\'s breathing patterns';

  @override
  String get i1_7 =>
      'Which of the following symptoms does a Reliever inhaler help relieve?';

  @override
  String get i1_7_a =>
      'Wheezing, coughing, chest tightness, and shortness of breath';

  @override
  String get i1_7_b => 'Skin rashes and itching';

  @override
  String get i1_7_c => 'Headaches and fever';

  @override
  String get i1_7_d => 'Food allergies and stomach aches';

  @override
  String get i1_8 => 'When should a patient use their Reliever inhaler?';

  @override
  String get i1_8_a => 'Only when needed or before exercise if prescribed';

  @override
  String get i1_8_b => 'Every single morning and evening without fail';

  @override
  String get i1_8_c => 'Only when they feel completely fine';

  @override
  String get i1_8_d => 'Twice a week whether they have symptoms or not';

  @override
  String get i1_9 =>
      'What is a key fact to remember about the Reliever inhaler\'s effect?';

  @override
  String get i1_9_a =>
      'It fixes the problem right now, but doesn\'t stop asthma from coming back';

  @override
  String get i1_9_b => 'It stops asthma from ever coming back';

  @override
  String get i1_9_c => 'It takes days or weeks to show its full benefit';

  @override
  String get i1_9_d => 'It must be avoided at all costs during an attack';

  @override
  String get i1_10 =>
      'What should you do if you start coughing, wheezing, or feeling tight-chested?';

  @override
  String get i1_10_a =>
      'Use your Reliever inhaler and follow your asthma action plan';

  @override
  String get i1_10_b => 'Take your Controller inhaler and go to sleep';

  @override
  String get i1_10_c => 'Stop taking all medications completely';

  @override
  String get i1_10_d => 'Wait 10 to 15 minutes before doing anything';

  @override
  String get i2_1 =>
      'When using a Metered-Dose Inhaler (MDI), how long should you hold your breath after inhaling the medicine?';

  @override
  String get i2_1_a => '10 seconds';

  @override
  String get i2_1_b => '2 seconds';

  @override
  String get i2_1_c => '1 minute';

  @override
  String get i2_1_d => '30 to 60 seconds';

  @override
  String get i2_2 =>
      'Where do you put the medicine when preparing a Nebulizer?';

  @override
  String get i2_2_a => 'Inside the nebulizer cup';

  @override
  String get i2_2_b => 'Directly onto the mask';

  @override
  String get i2_2_c => 'Into the spacer tube';

  @override
  String get i2_2_d => 'On the mouthpiece seal';

  @override
  String get i2_3 =>
      'How long might a Controller inhaler take to show its full benefit?';

  @override
  String get i2_3_a => 'Days or weeks';

  @override
  String get i2_3_b => 'Only 10 seconds';

  @override
  String get i2_3_c => 'Immediately during a cough';

  @override
  String get i2_3_d => 'Exactly 30 to 60 seconds';

  @override
  String get i2_4 =>
      'How should you breathe through a nebulizer mask or mouthpiece while the machine is running?';

  @override
  String get i2_4_a => 'Breathe normally through your mouth';

  @override
  String get i2_4_b => 'Hold your breath as long as possible';

  @override
  String get i2_4_c => 'Breathe quickly through your nose only';

  @override
  String get i2_4_d => 'Take sharp, gasping breaths';

  @override
  String get i2_5 =>
      'Which device requires you to turn on a machine to create a mist for breathing?';

  @override
  String get i2_5_a => 'A nebulizer';

  @override
  String get i2_5_b => 'A standard MDI';

  @override
  String get i2_5_c => 'A spacer tube';

  @override
  String get i2_5_d => 'A pillow cover';

  @override
  String get i2_6 =>
      'What should you do immediately before you press the canister and breathe in using a standard MDI?';

  @override
  String get i2_6_a => 'Breathe out fully';

  @override
  String get i2_6_b => 'Wait 60 seconds';

  @override
  String get i2_6_c => 'Wash the cup';

  @override
  String get i2_6_d => 'Turn off the machine';

  @override
  String get i2_7 =>
      'If you are feeling completely fine, what should you do regarding your Controller inhaler?';

  @override
  String get i2_7_a => 'Take it exactly as prescribed';

  @override
  String get i2_7_b => 'Stop taking it until you feel sick';

  @override
  String get i2_7_c => 'Replace it with a Reliever inhaler';

  @override
  String get i2_7_d => 'Double the dose to stay safe';

  @override
  String get i2_8 =>
      'What should you do with a nebulizer machine once the medicine mist completely stops?';

  @override
  String get i2_8_a => 'Turn off the machine and clean the equipment';

  @override
  String get i2_8_b => 'Leave it running for another hour';

  @override
  String get i2_8_c => 'Add water without turning it off';

  @override
  String get i2_8_d => 'Shake it while attached to a spacer';

  @override
  String get i2_9 =>
      'Which inhaler is meant for \"Daily Protection\" rather than quick relief?';

  @override
  String get i2_9_a => 'The Controller inhaler';

  @override
  String get i2_9_b => 'The Reliever inhaler';

  @override
  String get i2_9_c => 'The Rescue Hero';

  @override
  String get i2_9_d => 'The Nebulizer cup';

  @override
  String get i2_10 =>
      'What is the specific action required right after pressing a standard MDI canister once?';

  @override
  String get i2_10_a => 'Breathe in slowly and deeply';

  @override
  String get i2_10_b => 'Shake the inhaler again';

  @override
  String get i2_10_c => 'Breathe out slowly and fully';

  @override
  String get i2_10_d => 'Wait 30 to 60 seconds before breathing';

  @override
  String get eduTriggersHeaderDesc =>
      'Staying away from environmental factors that irritate your lungs is key to managing asthma.';

  @override
  String get eduReferralHeaderDesc =>
      'Track symptoms closely. Recognize clear warning points to maintain proper asthma control.';

  @override
  String get eduSecAirborneIrritants => 'Airborne Irritants';

  @override
  String get eduTriggerSmoke =>
      'Avoid smoke exposure (cigarettes, shisha, vaping, burning odors)';

  @override
  String get eduTriggerAllergens =>
      'Stay away from dust, pollen, mold, and pet dander if they worsen symptoms';

  @override
  String get eduTriggerChemicals =>
      'Avoid strong perfumes, cleaning sprays, and chemical fumes';

  @override
  String get eduSecHomeEnv => 'Home & Environment';

  @override
  String get eduTriggerVentilation =>
      'Keep the home clean and well ventilated to reduce allergens';

  @override
  String get eduTriggerBedCovers =>
      'Use mattress and pillow covers to decrease dust mites';

  @override
  String get eduTriggerColdAir =>
      'Cold air can trigger asthma — cover nose and mouth in cold weather';

  @override
  String get eduSecMedicalLifestyle => 'Medical & Lifestyle';

  @override
  String get eduTriggerInfections =>
      'Respiratory infections (flu/colds) worsen asthma — wash hands regularly & get flu vaccine';

  @override
  String get eduTriggerExercise =>
      'Exercise may trigger symptoms — use prescribed inhaler before exercise if advised';

  @override
  String get eduTriggerMeds =>
      'Avoid specific trigger medicines: aspirin, NSAIDs (Ibuprofen), or some beta blockers';

  @override
  String get eduTriggerStress =>
      'Emotional stress and anxiety can worsen asthma attacks';

  @override
  String get eduSecConsultDoctor => 'Consult Your Doctor If:';

  @override
  String get eduRefSevereSymptoms =>
      'Symptoms are becoming more frequent or more severe';

  @override
  String get eduRefRescueInhalerUsage =>
      'Rescue inhaler is needed more than usual (e.g. several times per week)';

  @override
  String get eduRefNightAwakening =>
      'Nighttime awakening due to cough, wheezing, or shortness of breath';

  @override
  String get eduRefDiffBreathingWalking =>
      'Difficulty speaking, walking, or breathing normally';

  @override
  String get eduRefLowPeakFlow =>
      'Peak flow readings are decreasing or staying low';

  @override
  String get eduEmergencyTitle => 'EMERGENCY — Refer Immediately';

  @override
  String get eduEmergShortnessBreath =>
      'Severe shortness of breath or no improvement after rescue inhaler';

  @override
  String get eduEmergSilentChest =>
      'Silent chest (very little air movement heard)';

  @override
  String get eduEmergBlueLipsNails => 'Lips or fingernails turn blue';

  @override
  String get eduEmergDrowsiness => 'Confusion or drowsiness';

  @override
  String get eduEmergWorseningStatus =>
      'Symptoms rapidly worsen despite treatment';

  @override
  String get inhalerPageHeaderDesc =>
      'Select your specific inhaler device type to review the correct step-by-step application technique and instructional training videos.';

  @override
  String get mdiTitle => 'Metered-Dose Inhaler (MDI)';

  @override
  String get mdiSubtitle => 'Press and breathe slowly';

  @override
  String get mdiExample1 => 'Ventolin Evohaler';

  @override
  String get mdiExample2 => 'Vental Inhaler';

  @override
  String get mdiExample3 => 'Seretide Evohaler';

  @override
  String get mdiStep1 => 'Shake the inhaler.';

  @override
  String get mdiStep2 => 'Breathe out fully.';

  @override
  String get mdiStep3 =>
      'Place mouthpiece in your mouth and seal lips around it.';

  @override
  String get mdiStep4 => 'Press once and breathe in slowly and deeply.';

  @override
  String get mdiStep5 => 'Hold your breath for 10 seconds.';

  @override
  String get mdiStep6 => 'Breathe out slowly.';

  @override
  String get mdiStep7 =>
      'Wait 30–60 seconds before a second puff if prescribed.';

  @override
  String get spacerTitle => 'MDI with Spacer';

  @override
  String get spacerSubtitle => 'Uses a chamber for easier breathing';

  @override
  String get spacerExample1 => 'Ventolin + AeroChamber Spacer';

  @override
  String get spacerExample2 => 'Seretide Evohaler + Spacer';

  @override
  String get spacerExample3 => 'Floxitide Evohaler + Spacer';

  @override
  String get spacerStep1 => 'Shake inhaler and attach it to the spacer.';

  @override
  String get spacerStep2 => 'Breathe out fully.';

  @override
  String get spacerStep3 => 'Place spacer mouthpiece in your mouth.';

  @override
  String get spacerStep4 => 'Press the inhaler once into the spacer.';

  @override
  String get spacerStep5 => 'Take a slow deep breath in or 4–5 normal breaths.';

  @override
  String get spacerStep6 => 'Hold your breath for 10 seconds if possible.';

  @override
  String get spacerStep7 => 'Repeat if another puff is needed.';

  @override
  String get nebulizerTitle => 'Nebulizer';

  @override
  String get nebulizerSubtitle => 'Converts liquid medicine into a mist';

  @override
  String get nebulizerExample1 => 'Ventolin Nebules';

  @override
  String get nebulizerExample2 => 'Atrovent Nebules';

  @override
  String get nebulizerExample3 => 'Pulmicort Respules';

  @override
  String get nebulizerStep1 => 'Wash your hands.';

  @override
  String get nebulizerStep2 => 'Put the medicine into the nebulizer cup.';

  @override
  String get nebulizerStep3 => 'Attach the mask or mouthpiece.';

  @override
  String get nebulizerStep4 => 'Turn on the machine.';

  @override
  String get nebulizerStep5 =>
      'Breathe normally through the mouth until the mist stops (about 10–15 minutes).';

  @override
  String get nebulizerStep6 =>
      'Turn off the machine and clean the equipment after use.';

  @override
  String get dpiTitle => 'Dry Powder Inhaler (DPI)';

  @override
  String get dpiSubtitle => 'Breath-activated dry powder';

  @override
  String get dpiExample1 => 'Seretide Diskus';

  @override
  String get dpiExample2 => 'Ventolin Diskus';

  @override
  String get dpiExample3 => 'Inhalex';

  @override
  String get dpiStep1 => 'Load the dose.';

  @override
  String get dpiStep2 => 'Breathe out away from device.';

  @override
  String get dpiStep3 => 'Seal lips around mouthpiece.';

  @override
  String get dpiStep4 => 'Breathe in fast and deep.';

  @override
  String get dpiStep5 => 'Hold breath for 10 seconds.';

  @override
  String get dpiStep6 => 'Breathe out slowly.';

  @override
  String get pfmTitle => 'Peak Flow Meter (PFM)';

  @override
  String get pfmSubtitle => 'Measures your lung air flow capacity';

  @override
  String get pfmExample1 => 'Mini Wright Peak Flow Meter';

  @override
  String get pfmExample2 => 'Microlife PF100 Peak Flow Meter';

  @override
  String get pfmStep1 => 'Stand up straight.';

  @override
  String get pfmStep2 => 'Move marker to zero.';

  @override
  String get pfmStep3 => 'Take a deep breath.';

  @override
  String get pfmStep4 => 'Blow out hard and fast.';

  @override
  String get pfmStep5 => 'Repeat 3 times.';

  @override
  String get pfmStep6 => 'Record the highest reading.';

  @override
  String get respimatTitle => 'Respimat';

  @override
  String get respimatSubtitle => 'Generates a slow-moving soft mist';

  @override
  String get respimatExample1 => 'Spiriva Respimat';

  @override
  String get respimatExample2 => 'Combivent Respimat';

  @override
  String get respimatStep1 => 'Turn the base until it clicks.';

  @override
  String get respimatStep2 => 'Open the cap.';

  @override
  String get respimatStep3 => 'Breathe out slowly.';

  @override
  String get respimatStep4 =>
      'Press button while breathing in slowly and deeply.';

  @override
  String get respimatStep5 => 'Hold breath for 10 seconds.';

  @override
  String get spacerMaskTitle => 'Spacer and Mask';

  @override
  String get spacerMaskSubtitle => 'Ideal for infants and young children';

  @override
  String get spacerMaskExample1 => 'AeroChamber+ Mask';

  @override
  String get spacerMaskExample2 => 'BabyHaler Spacer';

  @override
  String get spacerMaskExample3 => 'Volumatic Spacer';

  @override
  String get spacerMaskStep1 => 'Shake inhaler well.';

  @override
  String get spacerMaskStep2 => 'Attach inhaler to spacer.';

  @override
  String get spacerMaskStep3 => 'Place mask tightly on face.';

  @override
  String get spacerMaskStep4 => 'Press one puff.';

  @override
  String get spacerMaskStep5 => 'Let patient breathe normally 5–6 breaths.';

  @override
  String get spacerMaskStep6 => 'Repeat if needed.';

  @override
  String get turbuhalerTitle => 'Turbuhaler';

  @override
  String get turbuhalerSubtitle => 'Inhale strongly and deeply';

  @override
  String get turbuhalerExample1 => 'Symbicort Turbuhaler';

  @override
  String get turbuhalerExample2 => 'Bricanyl Turbuhaler';

  @override
  String get turbuhalerStep1 => 'Unscrew and remove cap.';

  @override
  String get turbuhalerStep2 => 'Twist grip forward and back until click.';

  @override
  String get turbuhalerStep3 => 'Breathe out away from inhaler.';

  @override
  String get turbuhalerStep4 => 'Breathe in strongly and deeply.';

  @override
  String get turbuhalerStep5 => 'Hold breath for 10 seconds.';

  @override
  String get turbuhalerStep6 => 'Replace cap.';

  @override
  String get loginTitle => 'PuffPal Login';

  @override
  String get signupTitle => 'Sign Up';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get nameHint => 'Name';

  @override
  String get phoneHint => 'Phone Number';

  @override
  String get ageHint => 'Age';

  @override
  String get genderHint => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get loginButton => 'Login';

  @override
  String get signupButton => 'Sign Up';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Invalid email format';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordTooShort => 'Minimum 6 characters';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get phoneRequired => 'Phone number is required';

  @override
  String get phoneInvalidLength => 'Phone number must be exactly 11 digits';

  @override
  String get ageRequired => 'Please enter your age';

  @override
  String get ageInvalid => 'Enter a valid age (1-120)';

  @override
  String get genderRequired => 'Please select your gender';

  @override
  String get loginFailedException => 'Login failed: Invalid credentials';

  @override
  String get signupSuccessAlert => 'Sign-up successful! Please login.';

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get pocketAsthmaHelper => 'Your pocket-sized asthma helper.';

  @override
  String get asthmaCareSimple => 'Asthma care made simple!';

  @override
  String get asthmaCareDesc =>
      'Track symptoms, learn helpful tips, and breathe with confidence.';

  @override
  String get onboardingDoneTitle => 'Ready to breathe easier?';

  @override
  String get onboardingDoneDesc =>
      'Join PuffPal today and gain control over your asthma journey.';
}
