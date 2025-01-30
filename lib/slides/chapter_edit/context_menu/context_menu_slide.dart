import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/context_menu_builder.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/example_highlights.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/full_example.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

const _speakerNotes = '''
Let's put it all together now!
''';

class ContextMenuSlide extends FlutterDeckSlideWidget {
  ContextMenuSlide({
    super.key,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/context-menu',
            title: 'Context Menu',
            speakerNotes: _speakerNotes,
            steps: _allExamples.length,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
      builder: (context, step) => CodeHighlighter.buildSplitSlide(
        code: _allExamples[step - 1],
        builder: (context) =>
            buildRunningExample(context, step == _allExamples.length + 1),
      ),
    );
  }

  Widget buildRunningExample(BuildContext context, bool addContextMenu) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FullExample(
        contextMenuBuilder: addContextMenu ? contextMenuBuilder : null,
      ),
    );
  }
}

final _allExamples = [
  _codeExample1,
  _codeExample2,
  _codeExample3,
  _codeExample4,
  _codeExample5,
  _codeExample6,
];

const _codeExample1 = '''
class TextField {
  ...
  ///
  /// If not provided, will build a default menu based on the platform.
  ///
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  ...
}
''';

const _codeExample2 =
    '''/// Signature for a widget builder that builds a context menu for the given
typedef EditableTextContextMenuBuilder = Widget Function(
  BuildContext context,
  EditableTextState editableTextState,
);
''';

const _codeExample3 = '''
/// State for an [EditableText].
class EditableTextState extends State<EditableText> with AutomaticKeepAliveClientMixin<EditableText>, WidgetsBindingObserver, TickerProviderStateMixin<EditableText>, TextSelectionDelegate, TextInputClient implements AutofillClient {
  ...
 List<ContextMenuButtonItem> get contextMenuButtonItems {
 ...
 }
}
''';

const _codeExample4 = '''
Widget contextMenuBuilder(
    BuildContext ctx, EditableTextState editableTextState) {
  final value = editableTextState.textEditingValue;
  final buttonItems = editableTextState.contextMenuButtonItems;
  return AdaptiveTextSelectionToolbar.buttonItems(
    buttonItems: buttonItems,
    anchors: editableTextState.contextMenuAnchors,
  );
}
''';

const _codeExample5 = '''
final fillerButton = ContextMenuButtonItem(
  onPressed: () {
    // close context menu
    ContextMenuController.removeAny();
    Actions.handler(
      editableTextState.context,
      InsertFillerIntent(
        filler: getFillerText(),
      ),
    );
  },
  label: 'Insert fill text',
),
''';

const _codeExample6 = '''
final value = editableTextState.textEditingValue;
final startsWithFiller =
  value.toLowerCase().endsWith('filler'.substring(0, 5))
if (startsWithFiller) {
  buttonItems.insert(
    0,
    fillerButton,
  );
}
''';
