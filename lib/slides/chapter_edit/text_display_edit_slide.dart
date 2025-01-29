import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// Text selection docs https://api.flutter.dev/flutter/widgets/SelectableRegion-class.html
class TextDisplayEditSlide extends FlutterDeckSlideWidget {
  const TextDisplayEditSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/text-display-edit',
              title: 'Display rich text',
              steps: 3,
              speakerNotes: '''
Starts with simple example of applying text style
Advances to complex example with rich text
First Problem: text selection doesn't work out of the box

Text widget adds an SelectionContainer with _SelectableTextContainerDelegate
For rich text, we have to implement our own TextSelectionDelegate later!

TextSelectionDelegate used by RenderEditable
Source: docs for SelectableRegion
'''),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
        builder: (context, step) => switch (step) {
              1 => buildTextStyleExample(),
              2 => buildRichTextStyling(),
              _ => buildRichTextStylingWithSelection(),
            });
  }

  Widget buildTextStyleExample() {
    return FlutterDeckSlide.split(
      // TODO(jillme): adjust theme colors
      leftBuilder: (context) => const FlutterDeckCodeHighlight(
        code: '''Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hello',
              style: textTheme.bodyLarge,
            ),
            Text(
              'bold',
              style: textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'italic',
              style: textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            Text(
              'World',
              style: textTheme.bodyLarge?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          ],
        );''',
      ),
      rightBuilder: (context) => Center(
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
      rightBuilder: (context) => Center(
        child: SelectionArea(
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
      ),
    );
  }
}
