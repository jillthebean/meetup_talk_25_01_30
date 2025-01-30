import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';

class FlutterQuillExample extends StatefulWidget {
  const FlutterQuillExample({super.key});

  @override
  State<FlutterQuillExample> createState() => _FlutterQuillExampleState();
}

class _FlutterQuillExampleState extends State<FlutterQuillExample> {
  final QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        QuillSimpleToolbar(
          controller: _controller,
          configurations: const QuillSimpleToolbarConfigurations(),
        ),
        Expanded(
          child: QuillEditor.basic(
            controller: _controller,
            configurations: const QuillEditorConfigurations(),
          ),
        )
      ],
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
