import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:puffpal/views/questions_page.dart';

import '../l10n/app_localizations.dart';
import '../models/quiz.dart';

class QuizzesGamesPage extends StatefulWidget {
  const QuizzesGamesPage({super.key});

  @override
  State<QuizzesGamesPage> createState() => _QuizzesGamesPageState();
}

class _QuizzesGamesPageState extends State<QuizzesGamesPage> {
  final bool played = false;
  static const int initialPage=1;
  late PdfControllerPinch pdfController;

  @override
  void initState() {
    super.initState();
    pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/pdf/quizzes.pdf'), //make sure you add the pdf in asset
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 100, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('pdf part'),
            IconButton(onPressed: (){
              pdfController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.ease);
            }, icon: Icon(Icons.navigate_before)),
            PdfPageNumber(controller: pdfController, builder: (_, loadingState, pageNumber,totalPages)=>Container(
              alignment: Alignment.center,
              child: Text("$pageNumber/$totalPages"),
            )),
            IconButton(onPressed: (){
              pdfController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.ease);}, icon: Icon(Icons.navigate_next),),
            IconButton(onPressed: ()=>pdfController.loadDocument(PdfDocument.openAsset('assets/pdf/quizzes.pdf')), icon: Icon(Icons.refresh)),
            SizedBox(height: 40,),
            Text(
              AppLocalizations.of(context)!.quizzesTitle,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Column(
              children: List.generate(
                quizList.length,
                 (index) {
                  return Hero(
                    tag: quizList[index].image,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuestionsPage(quiz: quizList[index]),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 60),
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
                                      child: played
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
                                      quizList[index].title,
                                      style: TextStyle(
                                        color: Color(0xE0FBFAFA),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      quizList[index].noOfQuestions,
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
                          Padding(
                            padding: EdgeInsets.only(right: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  quizList[index].image,
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
