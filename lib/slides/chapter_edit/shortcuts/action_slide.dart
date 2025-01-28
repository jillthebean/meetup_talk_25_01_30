import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ActionSlide extends FlutterDeckSlideWidget {
  const ActionSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/edit-shortcuts-action',
              title: 'Actions',
              steps: 2,
              speakerNotes: '''

Why is there a difference Action <-> Intent?
1. ShortucsWidget can declare intents whithout knowing about the action
--> Easier separation between Shortcuts and Actions
--> Actions with models don't need to be propagated to Shortcuts
2. Intents carry instructions/data, action executes them
3. Actions can be en-/disabled, therefore they are no callbacks

Example: SelectAllTextIntent
- TextField selects all current text
- US phone number widget selects all three different TextFields (area code, prefix, line number)

Easier workaround with CallbackShortcuts --> unifies Shortcuts with actions by defining
bindings of type <ShortcutActivator, VoidCallback>

Not touched: ShortcutManager
'''),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckSlideStepsBuilder(
        builder: (context, step) {
          return FlutterDeckCodeHighlight(
            code: switch (step) {
              1 => _example1,
              _ => _example2,
            },
          );
        }
      ),
    );
  }
}

const _example1 = '''
class ExampleAction extends Action<ExampleIntent> {
  ExampleAction(this.model);

  final Model model;

  @override
  void invoke(InsertFillerIntent intent) {
    model.doStuff();
  }
}
''';

const _example2 = '''
class InsertFillerAction extends Action<InsertFillerIntent> {
  InsertFillerAction(this._controller);

  final TextEditingController _controller;

  @override
  void invoke(InsertFillerIntent intent) {
    final fillerRange = _controller.value.selection;
    final String replacementText = intent.filler;

    if (!fillerRange.isValid) return;

    // After the filler insertions, we want to palce the curser after
    // the filled in content
    final int lastSelectionIndex = max(
      fillerRange.baseOffset,
      fillerRange.baseOffset + replacementText.length,
    );

    _controller.value = TextEditingDeltaReplacement(
      oldText: _controller.value.text,
      replacedRange: fillerRange,
      replacementText: replacementText,
      selection: TextSelection.collapsed(offset: lastSelectionIndex),
      composing: TextRange.empty,
    ).apply(_controller.value);
  }
}
''';
