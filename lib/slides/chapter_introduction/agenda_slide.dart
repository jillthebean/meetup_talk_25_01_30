import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AgendaSlide extends FlutterDeckSlideWidget {
  const AgendaSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const Placeholder(),
    );
  }
}
