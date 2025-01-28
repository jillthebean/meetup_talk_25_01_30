import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

// Look at https://en.wikipedia.org/wiki/T9_(predictive_text)
class TextEditingElementsSlide extends FlutterDeckSlideWidget {
  const TextEditingElementsSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/common-features-history',
            steps: 3,
            speakerNotes:
'''
Ignore formats for now, focus on displaying the editing
Display rich text (What you see is what you get)
Keyboard Shortcuts
Toolbars
Context Menus
'''
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Toolbar above text field',
          'Toolbar above text input on mobile',
          'Context menu for simple format in messenger',
        ],
      ),
    );
  }
}
