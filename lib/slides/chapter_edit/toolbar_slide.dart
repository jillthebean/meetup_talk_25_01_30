import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ToolbarSlide extends FlutterDeckSlideWidget {
  const ToolbarSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/toolbar',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => const Placeholder(),
      rightBuilder: (context) => const Placeholder(),
    );
  }
}