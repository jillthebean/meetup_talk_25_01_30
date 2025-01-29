import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _speakerNotes = '''
Welcome to my talk Rich Text Adventures.
In this talk, I want to show you around in ways to customizing
a text input without leaving the realm of the widget world.
But first a few words about myself -

How did I end up to look into rich text editing in Flutter?
Feature request for simple functionality supporting existing
rich text formatting.
We looked into it and in the end decided to stick with an
existing framework instead of implementing it on our own.
But why?

--> Jumpscare
''';

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
            title: 'Welcome to flutter_deck',
            speakerNotes: _speakerNotes,
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'Rich Text Adventures',
      subtitle: 'An overview over rich text editing',
    );
  }
}
