import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/example_highlights.dart';

const _speakerNotes = '''
So far, we defined the Shortcut and Intent
The `Actions` widget is responsible to find matching actions for
intents. Therefore we have to declare a proper action to
handle this `Intent`

`Action`s extends the `Action` class and get the matching `Intent`
as type parameter and the invoke method will be called with the
actual `Intent`.
So we can include our logic for manipulating the text in here.


But why is there a difference Action <-> Intent?
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
''';

class ActionSlide extends FlutterDeckSlideWidget {
  const ActionSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/edit-shortcuts-action',
              title: 'Actions',
              steps: 2,
              speakerNotes: _speakerNotes),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) =>
          FlutterDeckSlideStepsBuilder(builder: (context, step) {
        final textTheme = FlutterDeckTheme.of(context).textTheme;
        return CodeHighlighter.highlight(
            switch (step) {
              1 => _example1,
              _ => _example2,
            },
            textTheme.bodyLarge,
        );
      }),
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
    // ...
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
