import 'package:puffpal/models/question.dart';

class QuizModel {
  final String title;
  final String noOfQuestions;
  final String image;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    required this.noOfQuestions,
    required this.image,
    required this.questions,
  });
}

List<QuizModel> quizList = [
  QuizModel(
    title: 'title1',
    noOfQuestions: '3 questions',
    image: 'lib/assets/images/inhaler3.png',
    questions: [
      QuestionModel(
        question: 'What is asthma?',
        options: ['A lung disease', 'A stomach issue', 'A bone problem'],
        answer: 'A lung disease',
      ),
      QuestionModel(
        question: 'Which device helps people with asthma?',
        options: ['Inhaler', 'Thermometer', 'Bandage'],
        answer: 'Inhaler',
      ),
      QuestionModel(
        question: 'Asthma affects:',
        options: ['Lungs', 'Eyes', 'Feet'],
        answer: 'Lungs',
      ),
    ],
  ),
];
