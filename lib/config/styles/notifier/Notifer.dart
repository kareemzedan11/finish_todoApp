import 'package:flutter/material.dart';

// Theme Notifier
class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners(); // Notify listeners when theme is changed
  }
}

// Language Notifier
class LanguageNotifier with ChangeNotifier {
  String _language = 'en';

  String get language => _language;

  void setLanguage(String languageCode) {
    _language = languageCode;
    notifyListeners(); // Notify listeners when language is changed
  }
}
