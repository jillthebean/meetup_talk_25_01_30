import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AgendaEditSlide extends FlutterDeckSlideWidget {
  const AgendaEditSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/agenda-edit',
              title: 'Build it in Flutter!',
              steps: 6,
              speakerNotes: '''
- Styling of text
- Styling with TextSpan and RichText
- Selectable Text
- Shortcuts
- Context Menu
- Toolbar
- Bring it together
'''),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(useSteps: true, items: const [
        'Display rich text',
        'Select rich text',
        'Keyboard shortcuts',
        'Context Menu',
        'Toolbar',
        'Bring it together'
      ]),
    );
  }
}
