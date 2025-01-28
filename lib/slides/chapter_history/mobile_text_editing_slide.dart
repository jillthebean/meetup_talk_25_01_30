import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

// Look at https://en.wikipedia.org/wiki/T9_(predictive_text)
class MobileTextEditingSlide extends FlutterDeckSlideWidget {
  const MobileTextEditingSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/mobile-text-editing-history',
            steps: 5,
            speakerNotes:
'''
T9 -> Swipe -> context menu in Whatsapp
Showcase elements in mobile text editing
Focused on input method as this dictates feature set per platform
Toolbar above keyboard vs toolbar above text field
'''
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          '<Image of T9/Nokia>',
          '<Image of Swipe gesture on keyboard>',
          '<Image of context menu in telegram>',
          '<Image of context menu in whatsapp>',
          '<Image of context menu in signal>',
          '<Image of toolbar above keyboard in github mobile>',
        ],
      ),
    );
  }
}
