abstract class SymptomNode {}

class SymptomTrackingQuestions {

  final String question;

  bool? answer;

  SymptomTrackingQuestions({
    required this.question,
    this.answer,
  });
}
List<SymptomTrackingQuestions> questions = [

  SymptomTrackingQuestions(
    question:
    "Daytime symptoms more than twice/week?",
  ),

  SymptomTrackingQuestions(
    question:
    "Any night waking due to asthma?",
  ),

  SymptomTrackingQuestions(
    question:
    "Rescue inhaler needed more than twice/week?",
  ),

  SymptomTrackingQuestions(
    question:
    "Any activity limitation due to asthma?",
  ),
];