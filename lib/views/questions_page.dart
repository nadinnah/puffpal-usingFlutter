import 'package:flutter/material.dart';
import '../models/quiz.dart';
import '../services/quiz_progress_service.dart';

class QuestionsPage extends StatefulWidget {
  final Quiz quiz;

  const QuestionsPage({super.key, required this.quiz});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {

  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool answered = false;
  List<String> currentShuffledOptions=[];

  @override
  void initState() {
    super.initState();
    shuffledQuestions();
  }

  void shuffledQuestions(){
    currentShuffledOptions = widget.quiz.questions[currentQuestionIndex].getShuffledAnswers();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizQuestion = widget.quiz.questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // QUIZ IMAGE
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Hero(
              tag: widget.quiz.image,
              child: Center(
                child: Image.asset(
                  widget.quiz.image,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
          ),

          // QUESTION TEXT
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              currentQuizQuestion.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // OPTIONS
          ...currentShuffledOptions.map((option) {
            final bool isCorrect = option == currentQuizQuestion.answers[0];
            final bool isSelected = option == selectedAnswer;

            Color getColor() {
              if (!answered) return Colors.white;

              if (isSelected && isCorrect) return Colors.green;
              if (isSelected && !isCorrect) return Colors.red;
              if (!isSelected && isCorrect) return Colors.green.shade200;

              return Colors.white;
            }

            return GestureDetector(
              onTap: answered
                  ? null
                  : () {
                setState(() {
                  selectedAnswer = option;
                  answered = true;
                  if (isCorrect) score++;

                });

                // Next question after 1 sec
                Future.delayed(Duration(seconds: 1), () {
                  if (currentQuestionIndex + 1 < widget.quiz.questions.length) {
                    setState(() {
                      currentQuestionIndex++;
                      answered = false;
                      selectedAnswer = null;
                      shuffledQuestions();
                    });
                  } else {
                    _showScoreDialog(context);
                  }
                });
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: getColor(),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  option,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  void _showScoreDialog(BuildContext context) async {
    await QuizProgressService.setPlayed(widget.quiz.title);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Quiz Completed!"),
        content: Text("Your score is $score out of ${widget.quiz.questions.length}"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to quiz list

            },
          )
        ],
      ),
    );
  }
}
