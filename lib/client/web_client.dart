import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_deck_web_client/flutter_deck_web_client.dart';
import 'package:meetup_talk_25_01_30/config/config.dart';
import 'package:meetup_talk_25_01_30/flutter_deck_config.dart';
import 'package:meetup_talk_25_01_30/slides/slides.dart';

class StandaloneClient extends StatelessWidget {
  const StandaloneClient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      client: FlutterDeckWebClient(),
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
