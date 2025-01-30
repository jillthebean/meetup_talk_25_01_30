import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor_plus/markdown_editor_plus.dart';

class MarkdownEditorExample extends StatefulWidget {
  const MarkdownEditorExample({super.key});

  @override
  State<MarkdownEditorExample> createState() => _MarkdownEditorExampleState();
}

class _MarkdownEditorExampleState extends State<MarkdownEditorExample> {
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: _exampleMarkdown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SafeArea(
      child: MarkdownAutoPreview(
        controller: controller,
        emojiConvert: true,
      ),
    ));
  }
}

const _exampleMarkdown = '''
# Simple Markdown
 - example here for you
''';
