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
            steps: 3,
            speakerNotes: _speakerNotes,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
        builder: (context, step) => switch (step) {
              1 => CodeHighlighter.buildSplitSlide(
                  code: _codeExample1,
                  builder: buildTextStyleExample,
                ),
              2 => buildRichTextStyling(),
              _ => buildRichTextStylingWithSelection(),
            });
  }

  Widget buildTextStyleExample(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hello ',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'bold ',
            style: FlutterDeckTheme.of(context)
                .textTheme
                .bodyLarge
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'italic ',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
          Text(
            'World',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildRichTextStyling() {
    return FlutterDeckSlide.split(
      // TODO(jillme): adjust theme colors
      leftBuilder: (context) => const FlutterDeckCodeHighlight(
        code: '''Text.rich(
        TextSpan(
          text: 'Hello ',
          style: textTheme.bodyLarge,
          children: <TextSpan>[
            TextSpan(
              text: 'bold ',
              style: textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'italic ',
              style: textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
            TextSpan(
              text: 'World',
              style: textTheme.bodyLarge?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      );''',
      ),
      rightBuilder: (context) => Center(
        child: Text.rich(
          TextSpan(
            text: 'Hello ',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
            children: <TextSpan>[
              TextSpan(
                text: 'bold ',
                style: FlutterDeckTheme.of(context)
                    .textTheme
                    .bodyLarge
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: 'italic ',
                style:
                    FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
              ),
              TextSpan(
                text: 'World',
                style:
                    FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(
                          decoration: TextDecoration.underline,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRichTextStylingWithSelection() {
    return FlutterDeckSlide.split(
      // TODO(jillme): adjust theme colors
      leftBuilder: (context) => const FlutterDeckCodeHighlight(
        code: '''SelectionArea(
            child: Text.rich(
              TextSpan(
                text: 'Hello ',
                style: textTheme.bodyLarge,
                children: <TextSpan>[
                  TextSpan(
                    text: 'bold ',
                    style: textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'italic ',
                    style: textTheme.bodyLarge?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  TextSpan(
                    text: 'World',
                    style: textTheme.bodyLarge?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ],
              ),
            ),
          );''',
      ),
      rightBuilder: (context) => const Center(child: CustomTextInput()),
    );
  }
}

const _codeExample1 = '''
Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Text(
      'Hello ',
      style: textTheme.bodyLarge,
    ),
    Text(
      'bold ',
      style: textTheme
          .bodyLarge
          .copyWith(fontWeight: FontWeight.bold),
    ),
    Text(
      'italic ',
      style: textTheme.bodyLarge.copyWith(
            fontStyle: FontStyle.italic,
          ),
    ),
    Text(
      'World',
      style: textTheme.bodyLarge.copyWith(
            decoration: TextDecoration.underline,
          ),
    ),
  ],
),
''';
const _codeExample2 = '';
const _codeExample3 = '';
