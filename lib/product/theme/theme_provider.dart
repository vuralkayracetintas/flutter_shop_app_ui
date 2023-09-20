import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light(useMaterial3: true);
  ThemeData get themeData => _themeData;

  void toogleTheme() {
    final isDark = _themeData == ThemeData.dark(useMaterial3: true);
    if (isDark) {
      _themeData = ThemeData.light(useMaterial3: true);
    } else {
      _themeData = ThemeData.dark(useMaterial3: true);
    }
    notifyListeners();
  }
}
