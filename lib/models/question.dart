import 'package:flutter/material.dart';

class Question {
  final String Function(BuildContext) getLocalizedText;

  final List<String> Function(BuildContext) getLocalizedAnswers;

  const Question({
    required this.getLocalizedText,
    required this.getLocalizedAnswers,
  });

  List<String> getShuffledAnswers(BuildContext context) {
    final localizedList = getLocalizedAnswers(context);
    final shuffledList = List<String>.from(localizedList);
    shuffledList.shuffle();
    return shuffledList;
  }
}