import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static const String playedKey = "played_quizzes_scores";

  static Future<void> setScore(String quizTitle, int score) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scoresList = prefs.getStringList(playedKey) ?? [];

    scoresList.removeWhere((item) => item.startsWith("$quizTitle:"));

    scoresList.add("$quizTitle:$score");
    await prefs.setStringList(playedKey, scoresList);
  }

  static Future<int?> getScore(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> scoresList = prefs.getStringList(playedKey) ?? [];

    for (var item in scoresList) {
      if (item.startsWith("$quizTitle:")) {
        return int.parse(item.split(":")[1]);
      }
    }
    return null;
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(playedKey);
  }
}