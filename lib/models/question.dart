import 'package:flutter/material.dart';

class Question {
  // A function that returns the localized question string when given a context
  final String Function(BuildContext) getLocalizedText;

  // A function that returns the list of choices (Index 0 must always be the correct one)
  final List<String> Function(BuildContext) getLocalizedAnswers;

  const Question({
    required this.getLocalizedText,
    required this.getLocalizedAnswers,
  });

  // Generates the shuffled list using the current locale's translations
  List<String> getShuffledAnswers(BuildContext context) {
    final localizedList = getLocalizedAnswers(context);
    final shuffledList = List<String>.from(localizedList);
    shuffledList.shuffle();
    return shuffledList;
  }
}