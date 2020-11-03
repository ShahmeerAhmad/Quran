import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;
  Typography defaultTypography;
  SharedPreferences prefs;
  bool _value;

  ThemeData dark = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF005459),
      //  Color(0xFF005459)
      iconTheme: IconThemeData(color: Color(0xFFB49A68)));

  ThemeData light = ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFFDFDFD),
      //  Color(0xFF005459)

      iconTheme: IconThemeData(color: Color(0xFFB49A68)));

  ThemeProvider(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  void setValue(bool val) {
    print(val);
    _value = val;
  }

  bool get getValue => _value ?? false;
  ThemeData getTheme() => _selectedTheme;
}
