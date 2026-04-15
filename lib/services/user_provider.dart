import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _userName = 'Guest';

  String get userName => _userName;

  void updateName(String newName) {
    if (_userName != newName) {
      _userName = newName;
      notifyListeners();
    }
  }
}