import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

// link to official guide https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts
class ShortcutsSlide extends FlutterDeckSlideWidget {
  const ShortcutsSlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/edit-shortcuts-widget',
            title: 'Shortcuts',
            steps: 2,
            speakerNotes: '''
Shortcuts widget to define keyboard shortcuts
Show example usage and look at the following parts:
- ShortcutActivator
- Actions
- Intent
''',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(
        builder: (context, step) => switch (step) {
              1 => _shortcutsWidget(context),
              2 => _shortcutsCode(context),
              _ => const Placeholder()
            });
  }

  Widget _shortcutsWidget(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'Shortcuts',
      subtitle:
          'This widget establishes a ShortcutManager to be used by its descendants when invoking an Action via a keyboard key combination that maps to an Intent.',
    );
  }

  Widget _shortcutsCode(BuildContext context) {
    return FlutterDeckSlide.blank(
        builder: (context) => FlutterDeckCodeHighlight(
              code: '''
Shortcuts(
  shortcuts: <ShortcutActivator, Intent>{ ... },
  child: Actions(
    actions: <Type, Action<Intent>>{ ... }
    child: ...
  )
)
''',
            ));
  }
}
