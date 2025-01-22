import 'package:flutter/widgets.dart';
import 'package:meetup_talk_25_01_30/client/ws_client.dart';

void main(List<String> args) {
  runApp(const WsClient(isPresenterView: false));
}
