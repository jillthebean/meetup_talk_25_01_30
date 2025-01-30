import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/gen/assets.gen.dart';

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
    final textTheme = FlutterDeckTheme.of(context).textTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Questions?',
              style: textTheme.display,
            ),
            Assets.qrCode.image(scale: 0.2),
          ],
        )),
      ),
    );
  }
}
