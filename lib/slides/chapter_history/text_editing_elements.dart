import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _speakerNotes = '''
So what are common elements we saw and know from text editing?
Of course we've got the whole 9 yards on "simple" text fields:
- listening on keyboard input from the platform/os
- rendering the text in specified font and style
- rendering the caret
- rendering text selection handles
- providing a context menu
- and not seen, but felt, support for shortcuts like 
  copy and past or select all

But we didn't even touch on rich text.
Additionally, we get support for:
- mixed inline styles like italic, bold, underline
- different fonts
- different text alignement
- variable line height
- sub and superscript
- potential non text addons like embedded images
- providing toolbars and extending context menu
  for all those actions

And we didn't even touch on how to store those edits.

So, let's look at where we came from: the example of the simplistic editor
at the start. Let's see which features we can implement with widgets pretty
straight forward.
Let's implement a text input where we can toggle the text bold and insert
lorem ipsum filler text.
This should render correctly as well as support shortcuts, be available
via context menu and toolbar - all without leaving widgets in Flutter.

To get started, let's look at how to style text in flutter.
''';

// Look at https://en.wikipedia.org/wiki/T9_(predictive_text)
class TextEditingElementsSlide extends FlutterDeckSlideWidget {
  const TextEditingElementsSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/common-features-history',
              steps: 4,
              speakerNotes: _speakerNotes),
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
