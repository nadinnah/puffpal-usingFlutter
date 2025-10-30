import 'package:flutter/material.dart';

class TrackSymptomsPage extends StatefulWidget {
  const TrackSymptomsPage({super.key});

  @override
  State<TrackSymptomsPage> createState() => _TrackSymptomsPageState();
}

class _TrackSymptomsPageState extends State<TrackSymptomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 55, 0, 0),
        child: Column(children: []),
      ),
    );
  }
}
