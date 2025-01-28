import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';


class AgendaHistory extends FlutterDeckSlideWidget {
  const AgendaHistory({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda-history',
            title: 'History of Rich Text',
            header: FlutterDeckHeaderConfiguration(
              showHeader: true,
              title: 'History of Rich Text',
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Evolution of word processors',
          'Rich text mobile',
          'Common functionality of rich text editing'
        ],
      ),
    );
  }
}
