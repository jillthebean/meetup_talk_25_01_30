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
ShortcutActivator actually has two implementers.
`SingleActivator` - not to be confused with your favorite dating app -
takes a logical key combined with modifiers
`CharacterActivator` meanwhile takes a character with some modifiers.
The last shines for characters, that or on different keys depending on
the keyboard layout. E.g. <C>-Z for undo always points to the key with
the Z on it, even though the Z key can be in different locations for
QWERTY and QWERTZ keyboards, for a character like ? which is activated via
modifier on different keys depending on the layout, it becomes more
complicated.

Okay, so we have a shortcut defined, let's write an intent!
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
