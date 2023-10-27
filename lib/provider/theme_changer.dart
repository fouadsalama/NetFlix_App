import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  hintColor: Colors.grey,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kMainColor,
    unselectedItemColor: kSecondColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins',
      // fontSize: 12,
    ),
  ),
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: kBackgroundColor,
  hintColor: Colors.grey,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kMainColor,
    unselectedItemColor: kSecondColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
  ),
);

class ThemeChanger with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeChanger() {
    loadTheme();
  }

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    saveTheme();
    notifyListeners();
  }

  Future<void> saveTheme() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDarkMode', _isDarkMode);
  }

  Future<void> loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    _isDarkMode = pref.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}
