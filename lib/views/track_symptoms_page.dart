import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:puffpal/models/symptom_tracking_questions.dart';
import 'package:puffpal/services/sqlite_service.dart';
import '../l10n/app_localizations.dart';

class AsthmaResult {
  final int severity; // 1, 2, 3 for heatmap
  final String label; // Fallback / Database baseline identifier value
  final Color color;

  AsthmaResult(this.severity, this.label, this.color);

  /// Dynamically retrieves localized assessment descriptions at runtime
  String getLocalizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (severity) {
      case 1:
        return l10n.wellControlledAsthma;
      case 2:
        return l10n.partlyControlledAsthma;
      case 3:
        return l10n.uncontrolledAsthma;
      default:
        return label;
    }
  }
}

class TrackSymptomsPage extends StatefulWidget {
  const TrackSymptomsPage({super.key});

  @override
  State<TrackSymptomsPage> createState() => _TrackSymptomsPageState();
}

class _TrackSymptomsPageState extends State<TrackSymptomsPage> {
  int currentIndex = 0;
  final LocalDatabase _localDb = LocalDatabase();
  final String _email = FirebaseAuth.instance.currentUser!.email!;
  bool alreadyTracked = false;
  Map<DateTime, int> heatmapData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadStatus();
  }

  Future<void> loadStatus() async {
    bool tracked = await _localDb.hasTrackedToday(_email);
    Map<DateTime, int> history = await _localDb.getSymptomHistory(_email);
    if (mounted) {
      setState(() {
        alreadyTracked = tracked;
        heatmapData = history;
        isLoading = false;
        currentIndex = 0;
      });
    }
  }

  /// Helper tool that matches baseline database values to localized equivalents
  String _getLocalizedDatabaseResult(BuildContext context, String rawDbResult) {
    final l10n = AppLocalizations.of(context)!;
    if (rawDbResult == "Well Controlled Asthma") return l10n.wellControlledAsthma;
    if (rawDbResult == "Partly Controlled Asthma") return l10n.partlyControlledAsthma;
    if (rawDbResult == "Uncontrolled Asthma") return l10n.uncontrolledAsthma;
    return rawDbResult;
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

  // --- VIEW 1: HEATMAP CALENDAR HISTORY ---
  Widget _buildHistoryView() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check_circle, color: Color(0xFF1E6096), size: 80),
        const SizedBox(height: 10),
        Text(
          l10n.trackedTodayTitle,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          l10n.trackedTodaySubtitle,
          style: const TextStyle(color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: HeatMap(
              datasets: heatmapData,
              colorMode: ColorMode.color,
              defaultColor: Colors.grey.shade200,
              textColor: Colors.black,
              showColorTip: false,
              scrollable: true,
              colorsets: const {
                1: Colors.green,
                2: Colors.orange,
                3: Colors.red,
              },
              onClick: (date) async {
                String? result = await _localDb.getResultForDate(_email, date);
                if (result != null && mounted) {
                  _showResultDialog(date, result);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.backToHome, style: const TextStyle(fontSize: 16)),
        )
      ],
    );
  }

  // --- VIEW 2: QUESTIONNAIRE ---
  Widget _buildQuestionnaireView() {
    // ⚠️ CRITICAL STEP: Accessing localized version of question object
    // Make sure your SymptomTrackingQuestion model implements a `getLocalizedQuestion(context)` method
    final question = questions[currentIndex];
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Text(
          l10n.questionProgress(currentIndex + 1, questions.length),
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
                  question.getLocalizedQuestion(context), // 👈 Dynamic translated Question Text hook
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                RadioListTile<bool>(
                  title: Text(l10n.yesLabel),
                  value: true,
                  groupValue: question.answer,
                  onChanged: (value) {
                    setState(() {
                      question.answer = value;
                    });
                  },
                ),
                RadioListTile<bool>(
                  title: Text(l10n.noLabel),
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
                child: Text(l10n.backButton),
              ),
            ElevatedButton(
              onPressed: () async {
                if (currentIndex == questions.length - 1) {
                  AsthmaResult result = calculateResult();

                  // We keep logging the stable English baseline string to the database
                  // to keep data query logs unified, but translate it in UI views!
                  await _localDb.logSymptom(_email, result.label, result.severity);

                  if (mounted) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(l10n.assessmentResultTitle),
                        content: Text(result.getLocalizedLabel(context)), // 👈 Localized alert display copy
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              loadStatus();
                            },
                            child: Text(l10n.okAction),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  setState(() {
                    currentIndex++;
                  });
                }
              },
              child: Text(
                currentIndex == questions.length - 1 ? l10n.submitButton : l10n.nextButton,
              ),
            ),
          ],
        ),
      ],
    );
  }

  AsthmaResult calculateResult() {
    int yesCount = questions.where((q) => q.answer == true).length;

    if (yesCount == 0) {
      return AsthmaResult(
        1,
        "Well Controlled Asthma",
        Colors.green,
      );
    }
    if (yesCount <= 2) {
      return AsthmaResult(
        2,
        "Partly Controlled Asthma",
        Colors.orange,
      );
    }
    return AsthmaResult(
      3,
      "Uncontrolled Asthma",
      Colors.red,
    );
  }

  void _showResultDialog(DateTime date, String result) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(l10n.logDateTitle(date.day, date.month, date.year)),
        content: Text(
          _getLocalizedDatabaseResult(context, result), // 👈 Parse database text into translation system match
          style: const TextStyle(fontSize: 17),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.okAction),
          )
        ],
      ),
    );
  }
}