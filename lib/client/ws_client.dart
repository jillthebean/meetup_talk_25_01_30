import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_deck_ws_client/flutter_deck_ws_client.dart';
import 'package:meetup_talk_25_01_30/config/config.dart';
import 'package:meetup_talk_25_01_30/flutter_deck_config.dart';
import 'package:meetup_talk_25_01_30/slides/slides.dart';

class WsClient extends StatelessWidget {
  const WsClient({
    required this.isPresenterView,
    super.key,
  });

  final bool isPresenterView;

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      client: FlutterDeckWsClient(
        uri: Uri.parse('ws://localhost:8080'),
      ),
      isPresenterView: isPresenterView,
      configuration: flutterDeckConfig,
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'Jill Geri',
        description: 'Engineering Manager @ sevdesk',
        socialHandle: 'jillthebean',
        imagePath: 'assets/me.png',
      ),
      slides: slides,
      lightTheme: createSevDeskDeckThemeData(),
    );
  }
}
