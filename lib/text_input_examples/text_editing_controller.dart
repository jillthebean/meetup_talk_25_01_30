import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    this.initialText = 'Hello bold world!',
  });

  final String initialText;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = CustomTextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: FlutterDeckTheme.of(context).textTheme.header,
    );
  }
}

class CustomTextEditingController extends TextEditingController {
  CustomTextEditingController({super.text});
  // TODO(jillthebean): add support for composing style
  // see super.buildTextSpan
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final text = value.text;
    final spans = <InlineSpan>[];
    bool bold = false;
    var currentText = text.characters;
    while (currentText.isNotEmpty) {
      final part = currentText.take(5);
      currentText = currentText.skip(5);
      spans.add(TextSpan(
          text: part.string,
          style: bold ? style?.copyWith(fontWeight: FontWeight.bold) : style));

      bold = !bold;
    }
    return TextSpan(children: spans);
  }
}
