import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/example_highlights.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/full_example.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

const _speakerNotes = '''
Let's put it all together now!
''';

class ToolbarSlide extends FlutterDeckSlideWidget {
  ToolbarSlide({
    super.key,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
              route: '/toolbar',
              title: 'Toolbar',
              speakerNotes: _speakerNotes,
              steps: _allExamples.length),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
      builder: (context, step) => CodeHighlighter.buildSplitSlide(
        code: _allExamples[step - 1],
        builder: buildRunningExample,
      ),
    );
  }

  Widget buildRunningExample(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: FullExample(),
    );
  }
}

final _allExamples = [
  _codeExample1,
  _codeExample2,
];

const _codeExample1 = '''
_controller = CustomTextEditingController(text: widget.initialText);
actions = <Type, Action<Intent>>{
  InsertFillerIntent: InsertFillerAction(_controller),
};
''';

const _codeExample2 = '''
Widget build(BuildContext context) {
  return Shortcuts(
    shortcuts: <ShortcutActivator, Intent>{
      const SingleActivator(LogicalKeyboardKey.keyL, control: true):
          InsertFillerIntent(
        filler: getFillerText(),
        cause: SelectionChangedCause.keyboard,
      ),
    },
    child: Actions(
      actions: actions,
      child: buildTextField(context),
    ),
  );
}
''';
