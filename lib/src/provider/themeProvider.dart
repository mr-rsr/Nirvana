import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;
  bool _darkMode;

  ThemeProvider(this._themeData, this._darkMode);

  setTheme(ThemeData themeData, bool darkMode) async {
    _themeData = themeData;
    _darkMode = darkMode;
    notifyListeners();
  }

  bool get getDarkMode => _darkMode;
  ThemeData get getTheme => _themeData;
}
