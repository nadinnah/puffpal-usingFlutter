import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizProgressService {
  static String _getUserKey() {
    final user = FirebaseAuth.instance.currentUser;
    String email = user?.email ?? "guest";
    return "played_quizzes_scores_$email";
  }

  static Future<void> setScore(String quizId, int score) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getUserKey();
    List<String> scoresList = prefs.getStringList(key) ?? [];

    scoresList.removeWhere((item) => item.startsWith("$quizId:"));
    scoresList.add("$quizId:$score");
    await prefs.setStringList(key, scoresList);
  }

  static Future<int?> getScore(String quizId) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getUserKey();
    List<String> scoresList = prefs.getStringList(key) ?? [];

    for (var item in scoresList) {
      if (item.startsWith("$quizId:")) {
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
