import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

// Look at https://en.wikipedia.org/wiki/T9_(predictive_text)
class TextEditingElementsSlide extends FlutterDeckSlideWidget {
  const TextEditingElementsSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/common-features-history',
            steps: 4,
            speakerNotes:
'''
Ignore formats for now, focus on displaying the editing
Display rich text (What you see is what you get)
Selection of rich text
Changing style for new input e.g. via toolbars
Changing style for selection e.g. via context menu, keyboard shortcuts
'''
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Live preview / WYSIWYG',
          'Handle selection of rich text',
          'Change current style for new input',
          'Edit style of existing text',
        ],
      ),
    );
  }
}
