import 'package:flutter/material.dart';
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

  static Widget highlight(String code) {
    if (_highlighter == null) {
      return const Placeholder();
    }
    return Scaffold(
        body: SingleChildScrollView(
            child: Text.rich(_highlighter!.highlight(code))));
  }
}
