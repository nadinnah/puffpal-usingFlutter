import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale _locale = const Locale('en');
  static const String _localeKey = "CACHED_LOCALE";

  Locale get locale => _locale;

  LanguageController() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedCode = prefs.getString(_localeKey) ?? 'en';
    _locale = Locale(cachedCode);
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    if (_locale.languageCode == languageCode) return;
    _locale = Locale(languageCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, languageCode);
  }
}