import 'package:puffpal/models/question.dart';

class QuizModel {
  final String title;
  final String noOfQuestions;
  final String image;
  final List<Question> questions;

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
      Question(
        question: 'What is asthma?',
        options: ['A lung disease', 'A stomach issue', 'A bone problem'],
        answer: 'A lung disease',
      ),
      Question(
        question: 'Which device helps people with asthma?',
        options: ['Inhaler', 'Thermometer', 'Bandage'],
        answer: 'Inhaler',
      ),
      Question(
        question: 'Asthma affects:',
        options: ['Lungs', 'Eyes', 'Feet'],
        answer: 'Lungs',
      ),
    ],
  ),
  QuizModel(
    title: 'title2',
    noOfQuestions: '3 questions',
    image: 'lib/assets/images/trialAsthma.png',
    questions: [
      Question(
        question: 'What is asthma?',
        options: ['A lung disease', 'A stomach issue', 'A bone problem'],
        answer: 'A lung disease',
      ),
      Question(
        question: 'Which device helps people with asthma?',
        options: ['Inhaler', 'Thermometer', 'Bandage'],
        answer: 'Inhaler',
      ),
      Question(
        question: 'Asthma affects:',
        options: ['Lungs', 'Eyes', 'Feet'],
        answer: 'Lungs',
      ),
    ],
  ),
];
