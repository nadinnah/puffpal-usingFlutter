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
];