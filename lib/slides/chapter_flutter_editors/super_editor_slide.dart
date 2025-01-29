import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class SuperEditorSlide extends FlutterDeckSlideWidget {
  const SuperEditorSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/super-editor',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
  builder: (context) => const Placeholder(),
);
  }
}