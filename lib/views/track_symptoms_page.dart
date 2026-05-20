import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:puffpal/models/symptom_tracking_questions.dart';
import 'package:puffpal/services/sqlite_service.dart';

class TrackSymptomsPage extends StatefulWidget {
  const TrackSymptomsPage({super.key});

  @override
  State<TrackSymptomsPage> createState() => _TrackSymptomsPageState();
}

class _TrackSymptomsPageState extends State<TrackSymptomsPage> {
  int currentIndex = 0;
  final LocalDatabase _localDb = LocalDatabase();
  final String _email = FirebaseAuth.instance.currentUser!.email!;

  late SymptomNode currentNode;
  bool alreadyTracked = false;
  Map<DateTime, int> heatmapData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  // Check if today is done and fetch the history map for the heatmap
  Future<void> loadStatus() async {
    bool tracked = await _localDb.hasTrackedToday(_email);
    Map<DateTime, int> history = await _localDb.getSymptomHistory(_email);
    setState(() {
      alreadyTracked = tracked;
      heatmapData = history;
      isLoading = false;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      // Background gradient to match your Home Page
      body: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFD8D0E5), Color(0xFFD9DBEF), Color(0xFFA8ABCA)],
            ),
          ),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: alreadyTracked ? _buildHistoryView() : _buildQuestionnaireView(),
          ),
        ),
      ),
    );
  }

  // --- VIEW 1: GITHUB STYLE CALENDAR ---
  Widget _buildHistoryView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF1E6096), size: 80),
        const SizedBox(height: 10),
        const Text("You're all set for today!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text("Tap a blue square to see past data",
            style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 30),

        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: HeatMap(
              datasets: heatmapData,
              colorMode: ColorMode.opacity,
              defaultColor: Colors.grey.shade200,
              textColor: Colors.black,
              showColorTip: false,
              scrollable: true,
              colorsets: const {
                1: Color(0xFF1E6096),
              },
              // THE CLICK ACTION
              onClick: (date) async {
                String? result = await _localDb.getResultForDate(_email, date);
                if (result != null) {
                  _showResultDialog(date, result);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Back to Home", style: TextStyle(fontSize: 16)),
        )
      ],
    );
  }

  Widget _buildQuestionnaireView() {
    final question = questions[currentIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),

        Text(
          "Question ${currentIndex + 1} of ${questions.length}",
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),

        const SizedBox(height: 20),

        Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                RadioListTile<bool>(
                  title: const Text("Yes"),
                  value: true,
                  groupValue: question.answer,
                  onChanged: (value) {
                    setState(() {
                      question.answer = value;
                    });
                  },
                ),

                RadioListTile<bool>(
                  title: const Text("No"),
                  value: false,
                  groupValue: question.answer,
                  onChanged: (value) {
                    setState(() {
                      question.answer = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (currentIndex > 0)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentIndex--;
                  });
                },
                child: const Text("Back"),
              ),

            ElevatedButton(
              onPressed: () async {
                // if last question → submit
                if (currentIndex == questions.length - 1) {
                  String result = calculateResult();

                  await _localDb.logSymptom(_email, result);

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Assessment Result"),
                      content: Text(result),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            loadStatus();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );

                } else {
                  // go next question
                  setState(() {
                    currentIndex++;
                  });
                }
              },
              child: Text(
                currentIndex == questions.length - 1
                    ? "Submit"
                    : "Next",
              ),
            ),
          ],
        ),
      ],
    );
  }

  String calculateResult() {

    int yesCount = questions
        .where((q) => q.answer == true)
        .length;

    if (yesCount == 0) {

      return "Well Controlled Asthma";
    }

    if (yesCount <= 2) {

      return "Partly Controlled Asthma";
    }

    return "Uncontrolled Asthma";
  }


  void _showResultDialog(DateTime date, String result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Log: ${date.day}/${date.month}/${date.year}"),
        content: Text(result, style: const TextStyle(fontSize: 17)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
        ],
      ),
    );
  }
}