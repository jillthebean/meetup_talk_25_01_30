import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

FlutterDeckThemeData createSevDeskDeckThemeData() {
  var materialTheme = ThemeData.light(useMaterial3: true);
  materialTheme = materialTheme.copyWith(
    colorScheme: materialTheme.colorScheme.copyWith(
      surface: const Color.fromARGB(255, 250, 248, 248),
      onSurface: const Color.fromARGB(255, 251, 82, 59),
    ),
  );
  final theme = FlutterDeckThemeData.fromTheme(materialTheme);
  return theme;
}

const _gradiendLightStart = Color.fromARGB(255, 45, 37, 112);
const _gradiendLightEnd = Color.fromARGB(252, 252, 106, 86);

// linear-gradient(90.0deg, rgba(45, 37, 112, 1.0) 15%, rgba(252, 106, 86, 1.0) 100%)
const lightGradientBackground = FlutterDeckBackground.gradient(
  LinearGradient(
    colors: [_gradiendLightStart, _gradiendLightEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
