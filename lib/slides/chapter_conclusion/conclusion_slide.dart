import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ConclusionSlide extends FlutterDeckSlideWidget {
  const ConclusionSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/conclusion',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Any questions?',
    );
  }
}
