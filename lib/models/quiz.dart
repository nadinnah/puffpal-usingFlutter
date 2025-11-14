class QuizModel{
  final String title;
  final String noOfQuestions;
  final String question;
  final List<String> options;
  final String answer;
  final String image;

  QuizModel({ required this.title,
  required this.noOfQuestions,
  required this.question,
  required this.options,
  required this.answer,
  required this.image,});
}

List<QuizModel> quizList = [
  QuizModel(
    title: 'title1',
    noOfQuestions: '10 questions',
    question: 'question1',
    options: ['option1', 'option2', 'option3', 'option4', 'option5', 'option6'],
    answer: 'option1',
    image: 'lib/assets/images/inhaler3.png',
  ),
  QuizModel(
    title: 'title2',
    noOfQuestions: '5 questions',
    question: 'question2',
    options: ['option1', 'option2', 'option3', 'option4', 'option5'],
    answer: 'option2',
    image: 'lib/assets/images/trialAsthma.png',
  ),
  QuizModel(
    title: 'title3',
    noOfQuestions: '4 questions',
    question: 'question3',
    options: ['option1', 'option2', 'option3', 'option4'],
    answer: 'option3',
    image: 'lib/assets/images/trialAsthma - Copy.png',
  ),
  QuizModel(
    title: 'title4',
    noOfQuestions: '5 questions',
    question: 'question4',
    options: ['option1', 'option2', 'option3', 'option4', 'option5'],
    answer: 'option1',
    image: 'lib/assets/images/trialAsthma - Copy (2).png',
  ),
];
