import 'package:flutter/material.dart';
import 'package:puffpal/views/pdf_viewer_page.dart';
import 'package:puffpal/views/questions_page.dart';

import '../l10n/app_localizations.dart';
import '../models/quiz.dart';
import '../services/quiz_progress_service.dart';

class QuizzesGamesPage extends StatefulWidget {
  const QuizzesGamesPage({super.key});

  @override
  State<QuizzesGamesPage> createState() => _QuizzesGamesPageState();
}

class _QuizzesGamesPageState extends State<QuizzesGamesPage> {
  Map<String, int?> quizScores = {};

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  void loadProgress() async {
    Map<String, int?> tempScores = {};
    for (var quiz in quizzes) {
      int? score = await QuizProgressService.getScore(quiz.title);
      tempScores[quiz.title] = score;
    }
    setState(() {
      quizScores = tempScores;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 120, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PdfViewerPage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xF54D97D5),
                      Color(0xFF1E6096),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf, color: Colors.white, size: 32),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Asthma Action Plan",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Open PDF",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            const Divider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.quizzesTitle,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 5),
                  child: IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.black,
                    iconSize: 30,
                    onPressed: () async {
                      await QuizProgressService.reset();
                      setState(() {
                        quizScores.clear(); // remove ticks instantly
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(quizzes.length, (index) {
                final quiz = quizzes[index];
                final bool isPlayed = quizScores[quiz.title] != null;
                final int? score = quizScores[quiz.title];
                return Opacity(
                  opacity: isPlayed ? 0.7 : 1,
                  child: Hero(
                    tag: quizzes[index].image,
                    child: GestureDetector(
                      onTap: isPlayed
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QuestionsPage(quiz: quizzes[index]),
                                ),
                              ).then((_) {
                                loadProgress(); // refresh the ticks
                              });
                            },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: index == 0 ? 40 : 60),
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              elevation: 5,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xF54D97D5),
                                      Color(0xFF1E6096),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white70,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: isPlayed
                                          ? Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 30,
                                            )
                                          : Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      quizzes[index].title,
                                      style: TextStyle(
                                        color: Color(0xE0FBFAFA),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          quiz.noOfQuestions,
                                          style: const TextStyle(
                                            color: Colors.white60,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (isPlayed) ...[
                                          const Text(
                                            " • ",
                                            style: TextStyle(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          Text(
                                            "Score: $score/${quiz.questions.length}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: index == 0 ? -30 : 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  quizzes[index].image,
                                  height: 150,
                                  width: 150,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
