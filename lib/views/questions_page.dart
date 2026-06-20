import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';
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
  List<String> rawCorrectAnswersReference = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadQuestionOptions();
  }

  void loadQuestionOptions() {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    rawCorrectAnswersReference = currentQuestion.getLocalizedAnswers(context);
    currentShuffledOptions = currentQuestion.getShuffledAnswers(context);
  }

  void _showDialogue() {
    final String titleText = AppLocalizations.of(context)!.quizCompleted;
    final String bodyText = AppLocalizations.of(
      context,
    )!.scoreMessage(score, widget.quiz.questions.length);

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
            ),
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
            ),
          ],
        ),
      );
    }
  }

  void _showScoreDialog(BuildContext context) async {
    final String quizUniqueKey = widget.quiz.id;

    await QuizProgressService.setScore(quizUniqueKey, score);
    _showDialogue();
  }

  void _goNext() {
    if (currentQuestionIndex + 1 < widget.quiz.questions.length) {
      setState(() {
        currentQuestionIndex++;
        answered = false;
        selectedAnswer = null;
        loadQuestionOptions();
      });
    } else {
      _showScoreDialog(context);
    }
  }

  Widget _buildFeedbackPanel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bool wasCorrect = selectedAnswer == rawCorrectAnswersReference[0];
    final bool isLast =
        currentQuestionIndex + 1 >= widget.quiz.questions.length;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: wasCorrect ? const Color(0xFFE6F4EA) : const Color(0xFFFDECEA),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: wasCorrect ? Colors.green : Colors.red.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                wasCorrect ? Icons.check_circle : Icons.info,
                color: wasCorrect ? Colors.green.shade700 : Colors.red.shade700,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  wasCorrect ? l10n.feedbackCorrect : l10n.feedbackIncorrect,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (!wasCorrect) ...[
            const SizedBox(height: 6),
            Text(
              l10n.correctAnswerWas(rawCorrectAnswersReference[0]),
              style: const TextStyle(fontSize: 15, height: 1.3),
            ),
          ],
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E6097),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: _goNext,
              child: Text(
                isLast ? l10n.seeResults : l10n.nextQuestion,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuizQuestion = widget.quiz.questions[currentQuestionIndex];
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Image.asset(
                  widget.quiz.image,
                  height: 300,
                  width: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                currentQuizQuestion.getLocalizedText(context),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ...currentShuffledOptions.map((option) {
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
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
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
            if (answered) _buildFeedbackPanel(context),
            SizedBox(height: verticalSpacing / 2),
          ],
        ),
      ),
    );
  }
}
