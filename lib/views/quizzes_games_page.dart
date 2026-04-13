import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
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
  Map<String, bool> playedQuizzes = {};

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  void loadProgress() async {
    for (var quiz in quizzes) {
      bool played = await QuizProgressService.isPlayed(quiz.title);
      playedQuizzes[quiz.title] = played;
    }
    setState(() {});
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
                      Color(0xFF39A3FA),
                      Color(0xFF2F8AD5),
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
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            const Divider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.quizzesTitle,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                GestureDetector(
                  onTap: () async {
                    await QuizProgressService.reset();
                    setState(() {
                      playedQuizzes.clear();   // remove ticks instantly
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF39A3FA),
                          Color(0xFF2F8AD5),
                          Color(0xFF1E6096),
                        ],
                      ),
                    ),
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(
                quizzes.length,
                 (index) {
                  return Hero(
                    tag: quizzes[index].image,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionsPage(quiz: quizzes[index]),
                          ),
                        ).then((_) {
                          loadProgress();   // refresh the ticks
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
                                      Color(0xFF39A3FA),
                                      Color(0xFF2F8AD5),
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
                                        border: Border.all(color: Colors.white70),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: playedQuizzes[quizzes[index].title] == true
                                          ? Icon(Icons.done, color: Colors.white, size: 30)
                                          : Icon(Icons.play_arrow, color: Colors.white, size: 30),

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
                                    Text(
                                      quizzes[index].noOfQuestions,
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                  );
                },
              ),
            ),
      
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
