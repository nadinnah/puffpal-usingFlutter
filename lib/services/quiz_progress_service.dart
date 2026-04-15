import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  // We remove the static constant and use a helper method to get a unique key
  static String _getUserKey() {
    final user = FirebaseAuth.instance.currentUser;
    // If no user is logged in, use a default, but ideally this won't happen on this page
    String email = user?.email ?? "guest";
    return "played_quizzes_scores_$email";
  }

  static Future<void> setScore(String quizTitle, int score) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getUserKey(); // Dynamic key based on user
    List<String> scoresList = prefs.getStringList(key) ?? [];

    scoresList.removeWhere((item) => item.startsWith("$quizTitle:"));
    scoresList.add("$quizTitle:$score");
    await prefs.setStringList(key, scoresList);
  }

  static Future<int?> getScore(String quizTitle) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getUserKey();
    List<String> scoresList = prefs.getStringList(key) ?? [];

    for (var item in scoresList) {
      if (item.startsWith("$quizTitle:")) {
        return int.parse(item.split(":")[1]);
      }
    }
    return null;
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getUserKey());
  }
}