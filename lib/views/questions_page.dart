import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart'; // 👈 Imported for dialog string localization
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

  List<String> currentShuffledOptions = [];
  List<String> rawCorrectAnswersReference = []; // 👈 Keeps track of localized answer indexes safely

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safely load and localize question options when widget receives context
    loadQuestionOptions();
  }

  void loadQuestionOptions() {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    // Fetch the baseline ordered list (Index 0 is always correct)
    rawCorrectAnswersReference = currentQuestion.getLocalizedAnswers(context);
    // Shuffle the answers using the method built inside the updated Question model
    currentShuffledOptions = currentQuestion.getShuffledAnswers(context);
  }

  void _showDialogue() {
    // Dynamically localized messages for the score dialog
    final String titleText = AppLocalizations.of(context)!.quizCompleted;
    final String bodyText = AppLocalizations.of(context)!.scoreMessage(score, widget.quiz.questions.length);

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(titleText),
          content: Text(bodyText),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(titleText),
          content: Text(bodyText),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
    }
  }

  void _showScoreDialog(BuildContext context) async {
    // Localize the key string passed to the persistent storage service
    final String quizProgressTitle = widget.quiz.getLocalizedTitle(context);
    await QuizProgressService.setScore(quizProgressTitle, score);
    _showDialogue();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizQuestion = widget.quiz.questions[currentQuestionIndex];
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double verticalSpacing = screenHeight * 0.12;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFD8D0E5),
                Color(0xFFD9DBEF),
                Color(0xFFA8ABCA),
              ],
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  currentQuizQuestion.getLocalizedText(context), // 👈 Dynamic translated Question Text
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              ...currentShuffledOptions.map((option) {
                // Index 0 of the original raw array is always the correct answer
                final bool isCorrect = option == rawCorrectAnswersReference[0];
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
                    Future.delayed(const Duration(seconds: 1), () {
                      if (currentQuestionIndex + 1 < widget.quiz.questions.length) {
                        setState(() {
                          currentQuestionIndex++;
                          answered = false;
                          selectedAnswer = null;
                          loadQuestionOptions(); // 👈 Updates strings and shuffles next question set
                        });
                      } else {
                        _showScoreDialog(context);
                      }
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: getColor(),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: verticalSpacing/2,)
            ],
          ),
        ),
      ),
    );
  }
}