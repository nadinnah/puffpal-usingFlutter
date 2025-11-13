import 'package:flutter/material.dart';

class QuizzesGamesPage extends StatefulWidget {
  const QuizzesGamesPage({super.key});

  @override
  State<QuizzesGamesPage> createState() => _QuizzesGamesPageState();
}

class _QuizzesGamesPageState extends State<QuizzesGamesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 300),
        child: Column(
          children: [
            Text(
              'Quizzes and Games',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            ),
          )
          ],
        ),
      ),
    );
  }
}
