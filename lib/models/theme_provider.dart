import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // New modern color palette
  static const Color primaryPurple = Color(0xFF6366F1);
  static const Color primaryPink = Color(0xFFEC4899);
  static const Color accentTeal = Color(0xFF06B6D4);
  static const Color accentCyan = Color(0xFF0891B2);
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textLight = Color(0xFFF1F5F9);
}
