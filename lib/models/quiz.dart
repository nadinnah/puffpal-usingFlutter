import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/question.dart';
import '../models/quiz.dart';

class Quiz {
  final String id; // 👈 1. Added stable ID field
  // A function that returns the localized title string when given a context
  final String Function(BuildContext) getLocalizedTitle;
  final String image;
  final List<Question> questions;

  Quiz({
    required this.id, // 👈 2. Added to constructor parameters
    required this.getLocalizedTitle,
    required this.image,
    required this.questions,
  });

  String getNoOfQuestions(BuildContext context) {
    return AppLocalizations.of(context)!.numberOfQuestions(questions.length);
  }
}

List<Quiz> quizzes = [
  // ==========================================
  // QUIZ 1: Asthma Basics Adventure
  // ==========================================
  Quiz(
    id: 'quiz_asthma_basics', // 👈 3. Passed unique ID
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quiz1Title,
    image: 'assets/images/inhaler3.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_1,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_1_a,
          AppLocalizations.of(context)!.q1_1_b,
          AppLocalizations.of(context)!.q1_1_c,
          AppLocalizations.of(context)!.q1_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_2,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_2_a,
          AppLocalizations.of(context)!.q1_2_b,
          AppLocalizations.of(context)!.q1_2_c,
          AppLocalizations.of(context)!.q1_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_3,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_3_a,
          AppLocalizations.of(context)!.q1_3_b,
          AppLocalizations.of(context)!.q1_3_c,
          AppLocalizations.of(context)!.q1_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_4,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_4_a,
          AppLocalizations.of(context)!.q1_4_b,
          AppLocalizations.of(context)!.q1_4_b2,
          AppLocalizations.of(context)!.q1_4_c,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_5,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_5_a,
          AppLocalizations.of(context)!.q1_5_b,
          AppLocalizations.of(context)!.q1_5_c,
          AppLocalizations.of(context)!.q1_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_6,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_6_a,
          AppLocalizations.of(context)!.q1_6_b,
          AppLocalizations.of(context)!.q1_6_c,
          AppLocalizations.of(context)!.q1_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_7,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_7_a,
          AppLocalizations.of(context)!.q1_7_b,
          AppLocalizations.of(context)!.q1_7_c,
          AppLocalizations.of(context)!.q1_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_8,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_8_a,
          AppLocalizations.of(context)!.q1_8_b,
          AppLocalizations.of(context)!.q1_8_c,
          AppLocalizations.of(context)!.q1_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_9,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_9_a,
          AppLocalizations.of(context)!.q1_9_b,
          AppLocalizations.of(context)!.q1_9_c,
          AppLocalizations.of(context)!.q1_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q1_10,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q1_10_a,
          AppLocalizations.of(context)!.q1_10_b,
          AppLocalizations.of(context)!.q1_10_c,
          AppLocalizations.of(context)!.q1_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 2: Asthma Hero Challenge
  // ==========================================
  Quiz(
    id: 'quiz_asthma_hero', // 👈 3. Passed unique ID
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quiz2Title,
    image: 'assets/images/trialAsthma.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_1,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_1_a,
          AppLocalizations.of(context)!.q2_1_b,
          AppLocalizations.of(context)!.q2_1_c,
          AppLocalizations.of(context)!.q2_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_2,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_2_a,
          AppLocalizations.of(context)!.q2_2_b,
          AppLocalizations.of(context)!.q2_2_c,
          AppLocalizations.of(context)!.q2_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_3,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_3_a,
          AppLocalizations.of(context)!.q2_3_b,
          AppLocalizations.of(context)!.q2_3_c,
          AppLocalizations.of(context)!.q2_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_4,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_4_a,
          AppLocalizations.of(context)!.q2_4_b,
          AppLocalizations.of(context)!.q2_4_c,
          AppLocalizations.of(context)!.q2_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_5,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_5_a,
          AppLocalizations.of(context)!.q2_5_b,
          AppLocalizations.of(context)!.q2_5_c,
          AppLocalizations.of(context)!.q2_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_6,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_6_a,
          AppLocalizations.of(context)!.q2_6_b,
          AppLocalizations.of(context)!.q2_6_c,
          AppLocalizations.of(context)!.q2_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_7,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_7_a,
          AppLocalizations.of(context)!.q2_7_b,
          AppLocalizations.of(context)!.q2_7_c,
          AppLocalizations.of(context)!.q2_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_8,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_8_a,
          AppLocalizations.of(context)!.q2_8_b,
          AppLocalizations.of(context)!.q2_8_c,
          AppLocalizations.of(context)!.q2_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_9,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_9_a,
          AppLocalizations.of(context)!.q2_9_b,
          AppLocalizations.of(context)!.q2_9_c,
          AppLocalizations.of(context)!.q2_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q2_10,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q2_10_a,
          AppLocalizations.of(context)!.q2_10_b,
          AppLocalizations.of(context)!.q2_10_c,
          AppLocalizations.of(context)!.q2_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 3: Doctor Visit or Not?
  // ==========================================
  Quiz(
    id: 'quiz_doctor_visit', // 👈 3. Passed unique ID
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quiz3Title,
    image: 'assets/images/doctorVisit.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_1,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_1_a,
          AppLocalizations.of(context)!.q3_1_b,
          AppLocalizations.of(context)!.q3_1_c,
          AppLocalizations.of(context)!.q3_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_2,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_2_a,
          AppLocalizations.of(context)!.q3_2_b,
          AppLocalizations.of(context)!.q3_2_c,
          AppLocalizations.of(context)!.q3_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_3,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_3_a,
          AppLocalizations.of(context)!.q3_3_b,
          AppLocalizations.of(context)!.q3_3_c,
          AppLocalizations.of(context)!.q3_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_4,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_4_a,
          AppLocalizations.of(context)!.q3_4_b,
          AppLocalizations.of(context)!.q3_4_c,
          AppLocalizations.of(context)!.q3_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_5,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_5_a,
          AppLocalizations.of(context)!.q3_5_b,
          AppLocalizations.of(context)!.q3_5_c,
          AppLocalizations.of(context)!.q3_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_6,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_6_a,
          AppLocalizations.of(context)!.q3_6_b,
          AppLocalizations.of(context)!.q3_6_c,
          AppLocalizations.of(context)!.q3_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_7,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_7_a,
          AppLocalizations.of(context)!.q3_7_b,
          AppLocalizations.of(context)!.q3_7_c,
          AppLocalizations.of(context)!.q3_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_8,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_8_a,
          AppLocalizations.of(context)!.q3_8_b,
          AppLocalizations.of(context)!.q3_8_c,
          AppLocalizations.of(context)!.q3_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_9,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_9_a,
          AppLocalizations.of(context)!.q3_9_b,
          AppLocalizations.of(context)!.q3_9_c,
          AppLocalizations.of(context)!.q3_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q3_10,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q3_10_a,
          AppLocalizations.of(context)!.q3_10_b,
          AppLocalizations.of(context)!.q3_10_c,
          AppLocalizations.of(context)!.q3_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 4: Emergency or Not?
  // ==========================================
  Quiz(
    id: 'quiz_emergency', // 👈 3. Passed unique ID
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quiz4Title,
    image: 'assets/images/emergency.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_1,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_1_a,
          AppLocalizations.of(context)!.q4_1_b,
          AppLocalizations.of(context)!.q4_1_c,
          AppLocalizations.of(context)!.q4_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_2,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_2_a,
          AppLocalizations.of(context)!.q4_2_b,
          AppLocalizations.of(context)!.q4_2_c,
          AppLocalizations.of(context)!.q4_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_3,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_3_a,
          AppLocalizations.of(context)!.q4_3_b,
          AppLocalizations.of(context)!.q4_3_c,
          AppLocalizations.of(context)!.q4_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_4,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_4_a,
          AppLocalizations.of(context)!.q4_4_b,
          AppLocalizations.of(context)!.q4_4_c,
          AppLocalizations.of(context)!.q4_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_5,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_5_a,
          AppLocalizations.of(context)!.q4_5_b,
          AppLocalizations.of(context)!.q4_5_c,
          AppLocalizations.of(context)!.q4_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_6,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_6_a,
          AppLocalizations.of(context)!.q4_6_b,
          AppLocalizations.of(context)!.q4_6_c,
          AppLocalizations.of(context)!.q4_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_7,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_7_a,
          AppLocalizations.of(context)!.q4_7_b,
          AppLocalizations.of(context)!.q4_7_c,
          AppLocalizations.of(context)!.q4_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_8,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_8_a,
          AppLocalizations.of(context)!.q4_8_b,
          AppLocalizations.of(context)!.q4_8_c,
          AppLocalizations.of(context)!.q4_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_9,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_9_a,
          AppLocalizations.of(context)!.q4_9_b,
          AppLocalizations.of(context)!.q4_9_c,
          AppLocalizations.of(context)!.q4_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.q4_10,
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.q4_10_a,
          AppLocalizations.of(context)!.q4_10_b,
          AppLocalizations.of(context)!.q4_10_c,
          AppLocalizations.of(context)!.q4_10_d,
        ],
      ),
    ],
  ),
  // ==========================================
  // QUIZ 5: Asthma Triggers - Part 1 (10 Questions)
  // ==========================================
  Quiz(
    id: 'quiz_triggers_part1',
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quizTriggersPart1Title,
    image: 'assets/images/asthma_triggers.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_1, // 1. Any type of smoke...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_1_a,
          AppLocalizations.of(context)!.t1_1_b,
          AppLocalizations.of(context)!.t1_1_c,
          AppLocalizations.of(context)!.t1_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_2, // 2. Decrease dust mites...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_2_a,
          AppLocalizations.of(context)!.t1_2_b,
          AppLocalizations.of(context)!.t1_2_c,
          AppLocalizations.of(context)!.t1_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_3, // 3. Household habits...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_3_a,
          AppLocalizations.of(context)!.t1_3_b,
          AppLocalizations.of(context)!.t1_3_c,
          AppLocalizations.of(context)!.t1_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_4, // 4. Annual vaccine...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_4_a,
          AppLocalizations.of(context)!.t1_4_b,
          AppLocalizations.of(context)!.t1_4_c,
          AppLocalizations.of(context)!.t1_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_5, // 5. Exercise triggers...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_5_a,
          AppLocalizations.of(context)!.t1_5_b,
          AppLocalizations.of(context)!.t1_5_c,
          AppLocalizations.of(context)!.t1_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_6, // 6. Over-the-counter pain medication...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_6_a,
          AppLocalizations.of(context)!.t1_6_b,
          AppLocalizations.of(context)!.t1_6_c,
          AppLocalizations.of(context)!.t1_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_7, // 7. Besides aspirin and NSAIDs...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_7_a,
          AppLocalizations.of(context)!.t1_7_b,
          AppLocalizations.of(context)!.t1_7_c,
          AppLocalizations.of(context)!.t1_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_8, // 8. Simple hygiene habit...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_8_a,
          AppLocalizations.of(context)!.t1_8_b,
          AppLocalizations.of(context)!.t1_8_c,
          AppLocalizations.of(context)!.t1_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_9, // 9. Air conditions / bad air day...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_9_a,
          AppLocalizations.of(context)!.t1_9_b,
          AppLocalizations.of(context)!.t1_9_c,
          AppLocalizations.of(context)!.t1_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t1_10, // 10. Running like you're in Olympics...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t1_10_a,
          AppLocalizations.of(context)!.t1_10_b,
          AppLocalizations.of(context)!.t1_10_c,
          AppLocalizations.of(context)!.t1_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 6: Asthma Triggers - Part 2 (10 Questions)
  // ==========================================
  Quiz(
    id: 'quiz_triggers_part2',
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quizTriggersPart2Title,
    image: 'assets/images/when_to_seek_help.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_1, // 11. Known triggers medications set...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_1_a,
          AppLocalizations.of(context)!.t2_1_b,
          AppLocalizations.of(context)!.t2_1_c,
          AppLocalizations.of(context)!.t2_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_2, // 12. Around someone smoking shisha...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_2_a,
          AppLocalizations.of(context)!.t2_2_b,
          AppLocalizations.of(context)!.t2_2_c,
          AppLocalizations.of(context)!.t2_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_3, // 13. Household spray triggers...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_3_a,
          AppLocalizations.of(context)!.t2_3_b,
          AppLocalizations.of(context)!.t2_3_c,
          AppLocalizations.of(context)!.t2_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_4, // 14. Outdoor trees/grass trigger...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_4_a,
          AppLocalizations.of(context)!.t2_4_b,
          AppLocalizations.of(context)!.t2_4_c,
          AppLocalizations.of(context)!.t2_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_5, // 15. Why wash hands regularly...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_5_a,
          AppLocalizations.of(context)!.t2_5_b,
          AppLocalizations.of(context)!.t2_5_c,
          AppLocalizations.of(context)!.t2_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_6, // 16. Indoor trigger carpets/furniture...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_6_a,
          AppLocalizations.of(context)!.t2_6_b,
          AppLocalizations.of(context)!.t2_6_c,
          AppLocalizations.of(context)!.t2_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_7, // 17. Chemical fumes from products...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_7_a,
          AppLocalizations.of(context)!.t2_7_b,
          AppLocalizations.of(context)!.t2_7_c,
          AppLocalizations.of(context)!.t2_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_8, // 18. What is pet dander...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_8_a,
          AppLocalizations.of(context)!.t2_8_b,
          AppLocalizations.of(context)!.t2_8_c,
          AppLocalizations.of(context)!.t2_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_9, // 19. Minimize bedroom triggers habit...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_9_a,
          AppLocalizations.of(context)!.t2_9_b,
          AppLocalizations.of(context)!.t2_9_c,
          AppLocalizations.of(context)!.t2_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.t2_10, // 20. Playing with cats or dogs...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.t2_10_a,
          AppLocalizations.of(context)!.t2_10_b,
          AppLocalizations.of(context)!.t2_10_c,
          AppLocalizations.of(context)!.t2_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 7: Inhaler Techniques - Part 1 (10 Questions)
  // ==========================================
  Quiz(
    id: 'quiz_inhalers_part1',
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quizInhalersPart1Title,
    image: 'assets/images/inhaler_techniques.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_1, // 1. Purpose of Controller inhaler...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_1_a,
          AppLocalizations.of(context)!.i1_1_b,
          AppLocalizations.of(context)!.i1_1_c,
          AppLocalizations.of(context)!.i1_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_2, // 2. How controller helps over time...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_2_a,
          AppLocalizations.of(context)!.i1_2_b,
          AppLocalizations.of(context)!.i1_2_c,
          AppLocalizations.of(context)!.i1_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_3, // 3. When to take Controller inhaler...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_3_a,
          AppLocalizations.of(context)!.i1_3_b,
          AppLocalizations.of(context)!.i1_3_c,
          AppLocalizations.of(context)!.i1_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_4, // 4. Does Controller provide quick relief...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_4_a,
          AppLocalizations.of(context)!.i1_4_b,
          AppLocalizations.of(context)!.i1_4_c,
          AppLocalizations.of(context)!.i1_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_5, // 5. Emergency rescue inhaler type...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_5_a,
          AppLocalizations.of(context)!.i1_5_b,
          AppLocalizations.of(context)!.i1_5_c,
          AppLocalizations.of(context)!.i1_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_6, // 6. Primary job of Reliever inhaler...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_6_a,
          AppLocalizations.of(context)!.i1_6_b,
          AppLocalizations.of(context)!.i1_6_c,
          AppLocalizations.of(context)!.i1_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_7, // 7. Symptoms Reliever helps relieve...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_7_a,
          AppLocalizations.of(context)!.i1_7_b,
          AppLocalizations.of(context)!.i1_7_c,
          AppLocalizations.of(context)!.i1_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_8, // 8. When to use Reliever inhaler...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_8_a,
          AppLocalizations.of(context)!.i1_8_b,
          AppLocalizations.of(context)!.i1_8_c,
          AppLocalizations.of(context)!.i1_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_9, // 9. Key fact about Reliever effect...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_9_a,
          AppLocalizations.of(context)!.i1_9_b,
          AppLocalizations.of(context)!.i1_9_c,
          AppLocalizations.of(context)!.i1_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i1_10, // 10. What to do if coughing/wheezing...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i1_10_a,
          AppLocalizations.of(context)!.i1_10_b,
          AppLocalizations.of(context)!.i1_10_c,
          AppLocalizations.of(context)!.i1_10_d,
        ],
      ),
    ],
  ),

  // ==========================================
  // QUIZ 8: Inhaler Techniques - Part 2 (10 Questions)
  // ==========================================
  Quiz(
    id: 'quiz_inhalers_part2',
    getLocalizedTitle: (context) => AppLocalizations.of(context)!.quizInhalersPart2Title,
    image: 'assets/images/inhaler3.png',
    questions: [
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_1, // 11. MDI hold breath timing...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_1_a,
          AppLocalizations.of(context)!.i2_1_b,
          AppLocalizations.of(context)!.i2_1_c,
          AppLocalizations.of(context)!.i2_1_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_2, // 12. Preparing medicine Nebulizer cup...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_2_a,
          AppLocalizations.of(context)!.i2_2_b,
          AppLocalizations.of(context)!.i2_2_c,
          AppLocalizations.of(context)!.i2_2_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_3, // 13. Controller full benefit days/weeks...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_3_a,
          AppLocalizations.of(context)!.i2_3_b,
          AppLocalizations.of(context)!.i2_3_c,
          AppLocalizations.of(context)!.i2_3_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_4, // 14. How to breathe through nebulizer mask...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_4_a,
          AppLocalizations.of(context)!.i2_4_b,
          AppLocalizations.of(context)!.i2_4_c,
          AppLocalizations.of(context)!.i2_4_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_5, // 15. Device requires turning on machine...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_5_a,
          AppLocalizations.of(context)!.i2_5_b,
          AppLocalizations.of(context)!.i2_5_c,
          AppLocalizations.of(context)!.i2_5_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_6, // 16. Immediately before pressing canister MDI...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_6_a,
          AppLocalizations.of(context)!.i2_6_b,
          AppLocalizations.of(context)!.i2_6_c,
          AppLocalizations.of(context)!.i2_6_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_7, // 17. Feeling completely fine, controller rule...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_7_a,
          AppLocalizations.of(context)!.i2_7_b,
          AppLocalizations.of(context)!.i2_7_c,
          AppLocalizations.of(context)!.i2_7_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_8, // 18. Nebulizer machine stop mist action...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_8_a,
          AppLocalizations.of(context)!.i2_8_b,
          AppLocalizations.of(context)!.i2_8_c,
          AppLocalizations.of(context)!.i2_8_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_9, // 19. Daily Protection inhaler...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_9_a,
          AppLocalizations.of(context)!.i2_9_b,
          AppLocalizations.of(context)!.i2_9_c,
          AppLocalizations.of(context)!.i2_9_d,
        ],
      ),
      Question(
        getLocalizedText: (context) => AppLocalizations.of(context)!.i2_10, // 20. Action right after pressing standard MDI...
        getLocalizedAnswers: (context) => [
          AppLocalizations.of(context)!.i2_10_a,
          AppLocalizations.of(context)!.i2_10_b,
          AppLocalizations.of(context)!.i2_10_c,
          AppLocalizations.of(context)!.i2_10_d,
        ],
      ),
    ],
  ),
];