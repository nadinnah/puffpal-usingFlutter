import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

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
        margin: EdgeInsets.only(top: 300, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.quizzesTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GridView.count(
              padding: EdgeInsets.only(top: 10),
              crossAxisCount: 1,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2.4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(8, (index) {
                return Material(
                  borderRadius:BorderRadius.circular(20),
                  elevation:5,
                  child: Container(
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
                      ),borderRadius:BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.done, color: Colors.white, size: 30),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Title 1',
                          style: TextStyle(
                            color: Color(0xE0FBFAFA),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10 questions',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
