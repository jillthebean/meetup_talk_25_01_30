import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ContextMenuSlide extends FlutterDeckSlideWidget {
  const ContextMenuSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/context-menu',
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