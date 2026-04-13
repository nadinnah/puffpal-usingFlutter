import 'package:puffpal/models/question.dart';

class Quiz {
  final String title;
  final String image;
  final List<Question> questions;

  Quiz({
    required this.title,
    required this.image,
    required this.questions,
  });

  String get noOfQuestions => '${questions.length} questions';
}

List<Quiz> quizzes = [
  Quiz(
    title: 'title1',
    image: 'assets/images/inhaler3.png',
    questions: [
      Question(
        "What is asthma?",
        [
          "A chronic disease that affects the airways",
          "A type of heart disease",
          "A skin condition",
          "A digestive disorder"
        ],
      ),
      Question(
        "Which of the following is a common symptom of asthma?",
        [
          "Shortness of breath",
          "Hair loss",
          "Blurred vision",
          "Tooth pain"
        ],
      ),
    ],
  ),
  Quiz(
    title: 'title2',
    image: 'assets/images/trialAsthma.png',
    questions: [
      Question(
        "What can trigger an asthma attack?",
        [
          "Dust and pollen",
          "Watching TV",
          "Drinking water",
          "Sleeping"
        ],
      ),
      Question(
        "Which medication is commonly used for quick relief during an asthma attack?",
        [
          "Inhaler (bronchodilator)",
          "Antibiotics",
          "Painkillers",
          "Vitamins"
        ],
      ),
      Question(
        "How can asthma be managed?",
        [
          "Using prescribed medication and avoiding triggers",
          "Ignoring symptoms",
          "Only drinking water",
          "Sleeping more"
        ],
      ),
      Question(
        "Which of the following is NOT a symptom of asthma?",
        [
          "Chest tightness",
          "Wheezing",
          "Frequent sneezing",
          "Shortness of breath"
        ],
      ),
      Question(
        "What happens to the airways during an asthma attack?",
        [
          "They become inflamed and narrow",
          "They expand permanently",
          "They stop functioning completely",
          "Nothing happens"
        ],
      ),
    ],
  ),
];
