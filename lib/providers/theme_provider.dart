import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    initState();
  }
  bool? _isdarkmode = false;
  ThemeMode themeMode = ThemeMode.light;
  void initState() async {
    final _prefs = await SharedPreferences.getInstance();
    _isdarkmode = _prefs.getBool('isDarkmode');
    themeMode = _isdarkmode != true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isDarkMode) async {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('isDarkmode', isDarkMode);
    notifyListeners();
  }
}
