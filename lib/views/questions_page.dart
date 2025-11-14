import 'package:flutter/material.dart';

import '../models/quiz.dart';

class QuestionsPage extends StatefulWidget {
  final QuizModel quiz;

  const QuestionsPage({super.key, required this.quiz});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Hero(
              tag: widget.quiz.image,
              child: Center(
                child: Image.asset(
                  widget.quiz.image,
                  height: 350,
                  width: 350,
                )
              ),
            ),
          ),


        ],
      ),
    );
  }
}
