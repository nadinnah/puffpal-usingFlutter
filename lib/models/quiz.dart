class QuizModel{
  final String title;
  final String noOfQuestions;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answer;

  QuizModel(this.title, this.noOfQuestions, this.question, this.option1, this.option2, this.option3, this.option4, this.answer);
}
List<QuizModel> quizList = [
  QuizModel('title1', '10', 'question1','option1', 'option2', 'option3', 'option4', 'answer1'),
  QuizModel('title2', '10', 'question2','option1', 'option2', 'option3', 'option4', 'answer2'),
  QuizModel('title3', '10', 'question3','option1', 'option2', 'option3', 'option4', 'answer3'),
  QuizModel('title4', '10', 'question4,','option1', 'option2', 'option3', 'option4', 'answer4')
];