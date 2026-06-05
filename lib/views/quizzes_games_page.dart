import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // Keyed on quiz.id rather than a localized title string
  Map<String, int?> quizScores = {};

  @override
  void initState() {
    super.initState();
    // Safely schedules state population after context is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProgress();
    });
  }

  void loadProgress() async {
    Map<String, int?> temporaryScores = {};

    for (var quiz in quizzes) {
      // Fetch data using our stable, production-ready quiz ID
      final score = await QuizProgressService.getScore(quiz.id);

      if (score != null) {
        temporaryScores[quiz.id] = score;
      }
    }

    if (mounted) {
      setState(() {
        quizScores = temporaryScores;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double verticalSpacing = screenHeight * 0.12;

    final double titleSize = screenWidth * 0.07;
    final double subtitleSize = screenWidth * 0.055;
    final double bodySize = screenWidth * 0.035;

    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 0),
      child: ListView(
        clipBehavior: Clip.none,
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFFF3F1FA),
                    Color(0xFFE2DFF2),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.black87,
                    size: 32,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.pdfTitle,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: subtitleSize * 0.75,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.openPdf,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: bodySize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.quizzesTitle,
                style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, top: 5),
                child: IconButton(
                  icon: const Icon(Icons.refresh),
                  color: Colors.black,
                  iconSize: 30,
                  onPressed: () async {
                    await QuizProgressService.reset();
                    setState(() {
                      quizScores.clear();
                    });
                  },
                ),
              ),
            ],
          ),
          ...quizzes.map((quiz) {
            // Check play records using the distinct quiz identifier
            final bool isPlayed = quizScores[quiz.id] != null;
            final int? score = quizScores[quiz.id];

            return Opacity(
              opacity: isPlayed ? 0.7 : 1,
              child: GestureDetector(
                onTap: isPlayed
                    ? null
                    : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionsPage(quiz: quiz),
                    ),
                  ).then((_) {
                    loadProgress();
                  });
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFF3F1FA),
                            Color(0xFFE2DFF2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              isPlayed ? Icons.done : Icons.play_arrow,
                              color: Colors.black87,
                              size: 30,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            quiz.getLocalizedTitle(context),
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                quiz.getNoOfQuestions(context),
                                style: GoogleFonts.roboto(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: bodySize,
                                  color: const Color(0xa11e1b1b),
                                ),
                              ),
                              if (isPlayed) ...[
                                const Text(
                                  " • ",
                                  style: TextStyle(color: Color(0x7B489DE3)),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.quizScoreDisplay(score ?? 0, quiz.questions.length),
                                  style: const TextStyle(
                                    color: Color(0xFF1A5687),
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
                    PositionedDirectional(
                      end: 0,
                      top: -5,
                      child: Image.asset(quiz.image, height: 150, width: 150),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          SizedBox(height: verticalSpacing / 2),
        ],
      ),
    );
  }
}