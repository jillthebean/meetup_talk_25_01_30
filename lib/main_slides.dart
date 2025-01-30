import 'package:flutter/widgets.dart';
import 'package:meetup_talk_25_01_30/client/ws_client.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/example_highlights.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  CodeHighlighter.init();
  runApp(const WsClient(isPresenterView: false));
}
