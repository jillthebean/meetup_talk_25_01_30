import 'package:flutter/material.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/filler_text_provider.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/intents.dart';

Widget contextMenuBuilder(
    BuildContext ctx, EditableTextState editableTextState) {
  final value = editableTextState.textEditingValue;
  final buttonItems = editableTextState.contextMenuButtonItems;
  if (_checkSnippetText(value.selection.textInside(value.text)) ||
      _checkSnippetText(value.selection.textBefore(value.text))) {
    buttonItems.insert(
      0,
      ContextMenuButtonItem(
        onPressed: () {
          // close context menu
          ContextMenuController.removeAny();
          Actions.invoke(
            editableTextState.context,
            InsertFillerIntent(
              filler: getFillerText(),
              cause: SelectionChangedCause.toolbar,
            ),
          );
        },
        label: 'Insert filler text',
      ),
    );
  }
  return AdaptiveTextSelectionToolbar.buttonItems(
    buttonItems: buttonItems,
    anchors: editableTextState.contextMenuAnchors,
  );
}

bool _checkSnippetText(String value) {
  return value.toLowerCase().endsWith('filler');
}
