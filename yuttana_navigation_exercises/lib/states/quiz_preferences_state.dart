import 'package:flutter/material.dart';

class QuizPreferencesState extends ChangeNotifier {
  String userName       = 'Guest';
  String userBio        = 'Quiz Lover';
  bool   soundEnabled   = true;
  bool   vibrationEnabled = true;
  ThemeMode themeMode   = ThemeMode.system;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void setBio(String bio) {
    userBio = bio;
    notifyListeners();
  }

  void setSoundEnable(bool value) {
    soundEnabled = value;
    notifyListeners();
  }

  void setVibrationEnable(bool value) {
    vibrationEnabled = value;
    notifyListeners();
  }

  void setTheme(ThemeMode? value) {
    if(value != null) {
      themeMode = value;
    }
    notifyListeners();
  }
}