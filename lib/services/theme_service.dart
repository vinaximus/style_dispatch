import 'package:flutter/material.dart';

ThemeData initTheme() {
  ThemeData baseTheme=ThemeData.light();
  ColorScheme colorCombo=ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 226, 165, 32));
  return baseTheme.copyWith(
    colorScheme: colorCombo,
    textTheme: baseTheme.textTheme.copyWith(
      labelLarge: baseTheme.textTheme.labelLarge?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
