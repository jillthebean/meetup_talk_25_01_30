import 'package:flutter/material.dart';
import 'package:meetup_talk_25_01_30/client/web_client.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/text_input_examples.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CodeHighlighter.init();
  runApp(const StandaloneClient());
}
