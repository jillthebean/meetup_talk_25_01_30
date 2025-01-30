import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:super_editor/super_editor.dart';

class SuperEditorExample extends StatefulWidget {
  const SuperEditorExample({super.key});

  @override
  State<SuperEditorExample> createState() => _SuperEditorExampleState();
}

class _SuperEditorExampleState extends State<SuperEditorExample> {
  late final MutableDocument _doc;
  late final MutableDocumentComposer _composer;
  late final Editor _docEditor;

  @override
  void initState() {
    super.initState();
    _doc = MutableDocument.empty("1");
    _composer = MutableDocumentComposer();
    _docEditor =
        createDefaultDocumentEditor(document: _doc, composer: _composer);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SuperEditor(
          editor: _docEditor,
          gestureMode: DocumentGestureMode.mouse,
        ),
      ),
    );
  }
}
