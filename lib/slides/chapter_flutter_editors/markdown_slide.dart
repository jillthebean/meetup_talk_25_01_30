import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/examples/editors/markdown_editor_example.dart';

class MarkdownSlide extends FlutterDeckSlideWidget {
  const MarkdownSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/markdown', title: 'Markdown editor'),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const MarkdownEditorExample(),
    );
  }
}
