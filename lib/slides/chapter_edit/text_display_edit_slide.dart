import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/example_highlights.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_editing_controller.dart';

const _speakerNotes = '''
So let's style a simple text element.
To get started, let's make it bold.
Easy enough, we can just use a single text widget

Now let's split the string and alternate between
bold and normal font weight every 5 characters.

Of course, we can solve this by using a row and chaining
the text widgets. But there is another way: `TextSpan`s!
We can conviently use the `Text.rich` constructor to
supply the root node to it and generate the others like
before.

In contrast to the `Text` widget, the `TextSpan` widget
supports nesting text. This very powerful for displaying
complex rich text. But it is even better as it is also the
key to get it into a `TextField`.

Let's examine a simple `TextField` setup - we create a
statefule widget with a `TextEditingController` in the state.
So what is the job of a `TextEditingController`?
It notifies listeners on updates to it's value. This value consist
of the current text and the current selection as well.
But more importantly, the controller supplies the `TextField` with
a `TextSpan` representing the current input via `buildTextSpan`.

And here we can finally integrate the `TextSpan` from earlier.
Let's create our own `TextEditingController` and override the
`buildTextSpan` method.

Easy enough! We don't have any logic in place yet to support
setting the bold option on specific text ranges as we hard coded it
For now, this shall suffice and we will first add the an other
functionality: inserting filler text!
To make it a little bit more fun, let's grab some dad jokes as filler text
I hope I don't regret that as I didn't check the API for a NSFW flag
So let us look into shortcuts
''';

class TextDisplayEditSlide extends FlutterDeckSlideWidget {
  const TextDisplayEditSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/text-display-edit',
            title: 'Display rich text',
            steps: 5,
            speakerNotes: _speakerNotes,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
        builder: (context, step) => switch (step) {
              1 => CodeHighlighter.buildSplitSlide(
                  code: _codeExample1,
                  builder: buildSimpleStyledText,
                ),
              2 => CodeHighlighter.buildSplitSlide(
                  code: _codeExample2,
                  builder: buildRowOfTextStyleExample,
                ),
              3 => CodeHighlighter.buildSplitSlide(
                  code: _codeExample3,
                  builder: buildRichTextStyling,
                ),
              4 => CodeHighlighter.buildSplitSlide(
                  code: _codeExample4,
                  builder: buildControllerInsights,
                ),
              _ => CodeHighlighter.buildSplitSlide(
                  code: _codeExample5,
                  builder: buildTextControllerExample,
                ),
            });
  }

  Widget buildSimpleStyledText(BuildContext context) {
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return Center(
      child: Text(
        'Hello bold world!',
        style: textTheme.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildRowOfTextStyleExample(BuildContext context) {
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hello ',
            style: textTheme.bodyLarge,
          ),
          Text(
            'bold ',
            style: textTheme.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'World!',
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget buildRichTextStyling(BuildContext context) {
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Hello ',
          style: textTheme.bodyLarge,
          children: <TextSpan>[
            TextSpan(
              text: 'bold ',
              style: textTheme.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            const TextSpan(
              text: 'World!',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildControllerInsights(BuildContext context) {
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return Center(
      child: Text(
        'Returns a TextSpan?!',
        style: textTheme.header,
      ),
    );
  }

  Widget buildTextControllerExample(BuildContext context) {
    return const Center(child: CustomTextInput());
  }
}

const _codeExample1 = '''
Text(
  'Hello bold world!',
  style: textTheme.bodyLarge.copyWith(
    fontWeight: FontWeight.bold,
  ),
);
''';

const _codeExample2 = '''
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Text(
      'Hello ',
      style: textTheme.bodyLarge,
    ),
    Text(
      'bold ',
      style:textTheme
          .bodyLarge
          .copyWith(fontWeight: FontWeight.bold),
    ),
    Text(
      'World!',
      style: textTheme.bodyLarge,
    ),
  ],
);
''';
const _codeExample3 = '''
Text.rich(
  TextSpan(
    text: 'Hello ',
    style: textTheme.bodyLarge,
    children: <TextSpan>[
      TextSpan(
        text: 'bold ',
        style: textTheme.bodyLarge.copyWith(fontWeight: FontWeight.bold),
      ),
      const TextSpan(
        text: 'World!',
      ),
    ],
  ),
);
''';
const _codeExample4 = '''
/// Builds [TextSpan] from current editing value.
///
/// By default makes text in composing range appear as underlined. Descendants
/// can override this method to customize appearance of text.
TextSpan buildTextSpan({required BuildContext context, TextStyle? style , required bool withComposing}) {...}
''';
const _codeExample5 = '''
class CustomTextEditingController extends TextEditingController {
  CustomTextEditingController({super.text});
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final text = value.text;
    final spans = <InlineSpan>[];
    bool bold = false;
    var currentText = text.characters;
    while (currentText.isNotEmpty) {
      final part = currentText.take(5);
      currentText = currentText.skip(5);
      spans.add(TextSpan(
          text: part.string,
          style: bold ? style?.copyWith(fontWeight: FontWeight.bold) : style));

      bold = !bold;
    }
    return TextSpan(children: spans);
  }
}
''';
