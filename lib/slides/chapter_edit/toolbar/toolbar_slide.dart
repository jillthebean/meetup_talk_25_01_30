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
        builder: (context) =>
            buildRunningExample(context, step >= _allExamples.length),
      ),
    );
  }

  Widget buildRunningExample(BuildContext context, bool showToolbar) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FullExample(
        includeToolbar: showToolbar,
      ),
    );
  }
}

final _allExamples = [
  _codeExample1,
  _codeExample2,
];

const _codeExample1 = '''
ContextMenuButtonItem(
  onPressed: () {
    // close context menu
    ContextMenuController.removeAny();
    Actions.handler(
      editableTextState.context,
      InsertFillerIntent(
        filler: getFillerText(),
        cause: SelectionChangedCause.toolbar,
      ),
    );
  },
  label: 'Insert filler text',
)
''';

const _codeExample2 = '''
ElevatedButton(
  onPressed: () => Actions.invoke(
    context,
    InsertFillerIntent(
      filler: getFillerText(),
      cause: SelectionChangedCause.toolbar,
    ),
  ),
  child: const Text('Insert filler'),
)
''';
