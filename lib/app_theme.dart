import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      // Use Material 3 color system for modern look
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.grey[50],

      // AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      // ✅ Fixed: use CardThemeData for Flutter 3.35+
      cardTheme: const CardThemeData(
        elevation: 2,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      // Text Theme
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 15),
        titleMedium: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
