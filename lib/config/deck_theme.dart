import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/config/colors.dart';

FlutterDeckThemeData createSevDeskDeckThemeData() {
  var materialTheme = ThemeData.light(useMaterial3: true);
  materialTheme = materialTheme.copyWith(
    colorScheme: materialTheme.colorScheme.copyWith(
      surface: PrimaryColors.calmSand,
      onSurface: PrimaryColors.vibrantRed,
    ),
  );
  final theme = FlutterDeckThemeData.fromTheme(materialTheme);
  return theme;
}

FlutterDeckCodeHighlightThemeData createCodeHighlightTheme(
    FlutterDeckThemeData theme) {
  return FlutterDeckCodeHighlightThemeData(
    textStyle: theme.textTheme.bodySmall,
  );
}
