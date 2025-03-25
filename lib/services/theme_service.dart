import 'package:flutter/material.dart';

ThemeData initTheme() {
  return ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 226, 165, 32)),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
