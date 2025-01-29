import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _speakerNotes = '''
The intent will be triggered by the shortcut.
So it needs to contain all information for when it
actually is invoked.
Therefore all an `Intent` needs to do is extend `Intent`
and you can fill in all necessary data.
In our case, we will provide the filler text here.

There are already a lot of existing intent, like `ScrollIntent`

Example of existing intents:
- ActivateIntent
- AutocompleteNextOptionIntent
- AutocompletePreviousOptionIntent
- ButtonActivateIntent
- CopySelectionTextIntent
- DirectionalFocusIntent
- DirectionalTextEditingIntent
- DismissIntent
- DoNothingAndStopPropagationIntent
- DoNothingAndStopPropagationTextIntent
- DoNothingIntent
- NextFocusIntent
- PasteTextIntent
- PreviousFocusIntent
- PrioritizedIntent
- sRedoTextIntent
- ReplaceTextIntent
- RequestFocusIntent
- ScrollIntent
- SelectAllTextIntent
- SelectIntent
- TransposeCharactersIntent
- UndoTextIntent
- UpdateSelectionIntent
- VoidCallbackIntent
''';

class IntentSlide extends FlutterDeckSlideWidget {
  const IntentSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/edit-shortcut-intent',
            title: 'Intent',
            speakerNotes: _speakerNotes,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const FlutterDeckCodeHighlight(code: '''
class InsertFillerIntent extends Intent {
  const InsertFillerIntent({
    required this.filler,
  });
  final String filler;
}
'''),
    );
  }
}
