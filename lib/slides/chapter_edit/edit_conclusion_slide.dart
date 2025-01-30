import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

class EditConclusionSlide extends FlutterDeckSlideWidget {
  const EditConclusionSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
              route: '/edit-conclusion', title: 'Full example'),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => const FullExample(
        includeToolbar: true,
        contextMenuBuilder: contextMenuBuilder,
      ),
      rightBuilder: (context) => Center(
        child: Text(
          'Full example',
          style: FlutterDeckTheme.of(context).textTheme.display,
        ),
      ),
    );
  }
}
