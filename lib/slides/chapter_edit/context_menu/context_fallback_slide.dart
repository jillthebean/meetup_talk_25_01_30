import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/gen/assets.gen.dart';

class ContextFallbackSlide extends FlutterDeckSlideWidget {
  const ContextFallbackSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/context-fallback',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (BuildContext context) => showFallback(
        context,
        Assets.fallback.contextMenuCustom,
        'Without snippet',
      ),
      rightBuilder: (BuildContext context) => showFallback(
        context,
        Assets.fallback.contextMenuDefault,
        'When snippet is detected',
      ),
    );
  }

  Widget showFallback(BuildContext context, AssetGenImage image, String label) {
    final theme = FlutterDeckTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Center(child: image.image()),
          ),
          const SizedBox(height: 4),
          Text(label, style: theme.textTheme.subtitle),
        ],
      ),
    );
  }
}
