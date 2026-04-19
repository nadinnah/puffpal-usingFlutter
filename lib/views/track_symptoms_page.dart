import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:puffpal/models/SymptomNode.dart';
import 'package:puffpal/services/sqlite_service.dart';

class TrackSymptomsPage extends StatefulWidget {
  const TrackSymptomsPage({super.key});

  @override
  State<TrackSymptomsPage> createState() => _TrackSymptomsPageState();
}

class _TrackSymptomsPageState extends State<TrackSymptomsPage> {
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
      currentNode = asthmaTree; // Reset the tree to the root
      isLoading = false;
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
      body: Container(
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
          child: alreadyTracked ? _buildHistoryView() : _buildTreeView(),
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

  // --- VIEW 2: DECISION TREE ---
  Widget _buildTreeView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Question Text
        if (currentNode is QuestionNode)
          Text(
            (currentNode as QuestionNode).question,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        else if (currentNode is ResultNode)
          _buildFinalResultCard(),

        const SizedBox(height: 40),

        // Buttons
        if (currentNode is QuestionNode)
          ...(currentNode as QuestionNode).options.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E6096),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () async {
                    if (entry.value is ResultNode) {
                      // Save text to DB before moving
                      String resultText = (entry.value as ResultNode).result;
                      await _localDb.logSymptom(_email, resultText);
                    }
                    setState(() {
                      currentNode = entry.value;
                    });
                  },
                  child: Text(entry.key, style: const TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            );
          }).toList()
        else
        // button to finally switch to calendar view after reading result
          ElevatedButton(
            onPressed: loadStatus,
            child: const Text("View My History"),
          ),
      ],
    );
  }

  Widget _buildFinalResultCard() {
    return Column(
      children: [
        const Icon(Icons.info_outline, size: 70, color: Color(0xFF1E6096)),
        const SizedBox(height: 20),
        Text(
          (currentNode as ResultNode).result,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ],
    );
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