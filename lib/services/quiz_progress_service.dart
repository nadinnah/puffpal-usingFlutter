import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static const String playedKey = "played_quizzes";

  static Future<void> setPlayed(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> playedList = prefs.getStringList(playedKey) ?? [];

    if (!playedList.contains(quizTitle)) {
      playedList.add(quizTitle);
      prefs.setStringList(playedKey, playedList);
    }
  }

  static Future<bool> isPlayed(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> playedList = prefs.getStringList(playedKey) ?? [];
    return playedList.contains(quizTitle);
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(playedKey);
  }
}
