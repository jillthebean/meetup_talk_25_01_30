import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _speakerNotes = '''
To outline some features of rich text editing, we will look at some
examples from well known software and isolate a few things that are
relevant to editing more than a text string, but an enhanced version
of it with more formatting, alignment, and additional features.


''';

const agenda = [
  'What is rich text', // a.k.a. history
  'Rich Text with Widgets',
  'Existing packages',
  'Conclusion',
];

class AgendaSlide extends FlutterDeckSlideWidget {
  const AgendaSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda',
            title: 'Agenda',
            speakerNotes: _speakerNotes,
            header: FlutterDeckHeaderConfiguration(
              showHeader: true,
              title: 'Agenda',
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Column(
        children: agenda
            .map((text) => ListTile(
                  title: Text("- $text", style: textTheme.title),
                ))
            .toList(),
      ),
    );
  }
}
