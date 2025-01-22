import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const agenda = [
  '1. Desktop',
  '2. Mobile',
];

class AgendaHistory extends FlutterDeckSlideWidget {
  const AgendaHistory({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda-history',
            title: 'Agenda',
            header: FlutterDeckHeaderConfiguration(
              showHeader: true,
              title: 'History of Rich Text',
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
