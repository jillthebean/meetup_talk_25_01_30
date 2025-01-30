import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/jumpscare_example.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

const _speakerNotes = '''
This is one of several files to showcase a simplistic editor implementation
in the official flutter examples.
As you can see, there is quite a lot going on.
This is a functioning simple editor, that support some functionality, but far not all.
Even this simple editor clocks in at almost 3000 lines of code to achieve:
- simple formatting text with bold,italic and underline
- subset of working keyboard shortcuts compared to TextField
- no conversion to common rich text format

To be fair, this is a showcase on how to do it from scrach
by re-implementing some of the existing functionality
as well as showing a visual representation of the history.
Which serves this purpose very well.

But it also shows the depth behind a simple text field.
Before we dive deeper though, let me give you an overview
of what is about to come.

Source code for example: https://github.com/flutter/samples/tree/main/simplistic_editor/lib/basic_text_input_client.dart
''';

class JumpScareSlide extends FlutterDeckSlideWidget {
  const JumpScareSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro-jumpscare',
            title: 'jumpscare',
            speakerNotes: _speakerNotes,
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return buildJumpScareSlide(context);
  }

  Widget buildJumpScareSlide(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => CodeHighlighter.highlight(jumpScareCode),
    );
  }
}
