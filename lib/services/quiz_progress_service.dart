import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static const String key = "playedQuizzes";

  // Save quiz as played
  static Future<void> markAsPlayed(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> played = prefs.getStringList(key) ?? [];
    if (!played.contains(quizTitle)) {
      played.add(quizTitle);
      await prefs.setStringList(key, played);
    }
  }

  // Check if quiz was played
  static Future<bool> isPlayed(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> played = prefs.getStringList(key) ?? [];
    return played.contains(quizTitle);
  }
}
