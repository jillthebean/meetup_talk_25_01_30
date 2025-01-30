import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/gen/assets.gen.dart';

const _speakerNotes = '''
I have to mention T9 - text on 9 keys - while also feeling a little bit
nostalgic. I hope that doesn't make me old yet.
T9 - https://en.wikipedia.org/wiki/T9_(predictive_text)

But lets jump quickly to some conventional use of text input on mobile devices
Messengers are definitely one of the the most used applications, so what is
different here?
First we have swiping for input. But that's on the OS level, so let's skip it.
Swipe Gesture on Gboard - private screenshot

Now formatting in messengers is rarely used in day to day life, we got
emojis after all. Still it exists in form of context menus or
a cut down markdown version for example ~ around words to make them
strikethrough in Threema
Context Menu for formatting in Threema - private screenshot

A more typical look to us engineers might be the GitHub App.
Here we actually don't have a WYSIWYG editor, but a plain old
markdown editor with a toolbar and a separate preview
GitHub Mobile Markdown editor - private screenshot
''';

final _images = [
  Assets.mobile.t9,
  Assets.mobile.swipe,
  Assets.mobile.threemaFormatting,
  Assets.mobile.githubMobile,
];

class MobileTextEditingSlide extends FlutterDeckSlideWidget {
  MobileTextEditingSlide({
    super.key,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
            route: '/mobile-text-editing-history',
              steps: _images.length,
              speakerNotes: _speakerNotes),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(builder: (context, step) {
      return FlutterDeckSlide.image(
        imageBuilder: (context) => _images[step-1].image(),
      );
    });
  }
}