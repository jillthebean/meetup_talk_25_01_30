import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ShortcutActivatorSlide extends FlutterDeckSlideWidget {
  const ShortcutActivatorSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/edit-shortcuts-activator',
            title: 'ShortcutActivator',
            speakerNotes: '''
SingleActivator - LogicalKey + Modifiers
CharacterActivator - like ? or £, not represented on logical keyboard

Explain modifiers:
''',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (BuildContext context) => FlutterDeckSlide.blank(
        builder: (context) => _singleActivator(context),
      ),
      rightBuilder: (BuildContext context) => FlutterDeckSlide.blank(
        builder: (context) => _characterActivator(context),
      ),
    );
  }

  Widget _singleActivator(BuildContext context) {
    return const FlutterDeckCodeHighlight(
      code: '''
const SingleActivator(
  this.trigger, {
  this.control = false,
  this.shift = false,
  this.alt = false,
  this.meta = false,
  this.numLock = LockState.ignored,
  this.includeRepeats = true,
})
''',
    );
  }

  Widget _characterActivator(BuildContext context) {
    return const FlutterDeckCodeHighlight(
      code: '''
const CharacterActivator(this.character, {
  this.alt = false,
  this.control = false,
  this.meta = false,
  this.includeRepeats = true,
});
''',
    );
  }
}
