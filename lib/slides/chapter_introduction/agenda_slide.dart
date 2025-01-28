import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _speakerNotes = '''
- Overview over all chapters
''';

const agenda = [
  '1. Goal of this talk',
  '2. What is rich text', // a.k.a. history
  '3. Rich Text in Flutter with Code Examples',
  '4. Rich Text Formats',
  '5. Conclusion',
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
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Column(
        children: agenda
            .map((text) => ListTile(
                  title: Text(text, style: theme.textTheme.displayMedium),
                ))
            .toList(),
      ),
    );
  }
}
