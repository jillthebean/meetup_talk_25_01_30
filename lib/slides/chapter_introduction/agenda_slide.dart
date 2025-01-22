import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const agenda = [
  '1. Rich Text History',
  '2. Definition of rich text',
  '3. Rich Text in Flutter',
  '4. Rich Text Editing in Flutter',
  '5. Rich Text Formats',
  '6. Conclusion',
];

class AgendaSlide extends FlutterDeckSlideWidget {
  const AgendaSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda',
            title: 'Agenda',
            speakerNotes: 'Overview over all chapters',
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
