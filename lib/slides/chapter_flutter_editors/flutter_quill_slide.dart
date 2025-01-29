import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterQuillSlide extends FlutterDeckSlideWidget {
  const FlutterQuillSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-quill',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
  builder: (context) => const Placeholder(),
);
  }
}