import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart'; // Ensure this import points to your l10n directory

abstract class SymptomNode {}

class SymptomTrackingQuestions {
  final String id;       // 🟢 Stable identifier to fetch the translation key
  final String question; // Fallback English text
  bool? answer;

  SymptomTrackingQuestions({
    required this.id,
    required this.question,
    this.answer,
  });

  /// 🟢 Dynamically bridges the UI file to your ARB definitions
  String getLocalizedQuestion(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (id) {
      case 'daytime':
        return l10n.questionDaytime;
      case 'night_waking':
        return l10n.questionNightWaking;
      case 'rescue_inhaler':
        return l10n.questionRescueInhaler;
      case 'activity_limitation':
        return l10n.questionActivityLimitation;
      default:
        return question; // Fallback to raw property text
    }
  }
}

List<SymptomTrackingQuestions> questions = [
  SymptomTrackingQuestions(
    id: "daytime",
    question: "Daytime symptoms more than twice/week?",
  ),
  SymptomTrackingQuestions(
    id: "night_waking",
    question: "Any night waking due to asthma?",
  ),
  SymptomTrackingQuestions(
    id: "rescue_inhaler",
    question: "Rescue inhaler needed more than twice/week?",
  ),
  SymptomTrackingQuestions(
    id: "activity_limitation",
    question: "Any activity limitation due to asthma?",
  ),
];