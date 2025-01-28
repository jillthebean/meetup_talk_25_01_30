import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntentSlide extends FlutterDeckSlideWidget {
  const IntentSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/edit-shortcut-intent', title: 'Intent', speakerNotes: '''
- propagated via the ActionDispatcher
- intents configure actions, e.g. DirectionalFocusIntent -> DirectionalFocusAction
- don't need to know more thanks to this abstraction

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
'''),
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
