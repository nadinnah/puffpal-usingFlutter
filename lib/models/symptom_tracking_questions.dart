import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

abstract class SymptomNode {}

class SymptomTrackingQuestions {
  final String id;
  final String question;
  bool? answer;

  SymptomTrackingQuestions({
    required this.id,
    required this.question,
    this.answer,
  });

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
        return question;
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
