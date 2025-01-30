import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/filler_text_provider.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/intents.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

typedef ContextMenuBuilder = Widget Function(
    BuildContext context, EditableTextState editableTextState);

class FullExample extends StatefulWidget {
  const FullExample({
    super.key,
    this.contextMenuBuilder,
    this.includeToolbar = false,
    this.initialText = '',
  });

  final ContextMenuBuilder? contextMenuBuilder;

  final bool includeToolbar;
  final String initialText;

  @override
  State<FullExample> createState() => _FullExampleState();
}

class _FullExampleState extends State<FullExample> {
  late final TextEditingController _controller;
  late final Map<Type, Action<Intent>> actions;

  @override
  void initState() {
    super.initState();
    _controller = CustomTextEditingController(text: widget.initialText);
    actions = <Type, Action<Intent>>{
      InsertFillerIntent: InsertFillerAction(_controller),
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <ShortcutActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.keyL, control: true):
            InsertFillerIntent(
          filler: getFillerText(),
          cause: SelectionChangedCause.keyboard,
        ),
      },
      child: Actions(
        actions: actions,
        child: buildTextField(context),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    final textField = TextField(
      expands: true,
      maxLines: null,
      minLines: null,
      controller: _controller,
      style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
      contextMenuBuilder: widget.contextMenuBuilder,
    );
    return textField;
  }
}

class InsertFillerAction extends Action<InsertFillerIntent> {
  InsertFillerAction(this._controller);

  final TextEditingController _controller;

  @override
  void invoke(InsertFillerIntent intent) {
    final fillerRange = _controller.value.selection;
    final String replacementText = intent.filler;

    if (!fillerRange.isValid) return;

    // After the filler insertions, we want to palce the curser after
    // the filled in content
    final int lastSelectionIndex = max(
      fillerRange.baseOffset,
      fillerRange.baseOffset + replacementText.length,
    );

    _controller.value = TextEditingDeltaReplacement(
      oldText: _controller.value.text,
      replacedRange: fillerRange,
      replacementText: replacementText,
      selection: TextSelection.collapsed(offset: lastSelectionIndex),
      composing: TextRange.empty,
    ).apply(_controller.value);
  }
}
