import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/config/colors.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class CodeHighlighter {
  static Highlighter? _highlighter;
  static init() async {
    // Load the default light theme and create a highlighter.
    if (_highlighter == null) {
      await Highlighter.initialize(['dart']);
      var theme = await HighlighterTheme.loadDarkTheme();
      _highlighter = Highlighter(
        language: 'dart',
        theme: theme,
      );
    }
  }

  static Widget highlight(String code, [TextStyle? style]) {
    if (_highlighter == null) {
      return const Placeholder();
    }
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(color: PrimaryColors.deepBlue),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Text.rich(
              _highlighter!.highlight(code),
              style: style,
            ),
          ),
        ),
      ),
    );
  }

  static Widget buildSplitSlide({
    required String code,
    required Widget Function(BuildContext) builder,
  }) {
    return FlutterDeckSlide.split(
      leftBuilder: builder,
      rightBuilder: (context) {
        final textTheme = FlutterDeckTheme.of(context).textTheme;
        return CodeHighlighter.highlight(code, textTheme.bodyLarge);},
    );
  }
}
