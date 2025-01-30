import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/config/colors.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/filler_text_provider.dart';
import 'package:meetup_talk_25_01_30/text_input_examples/intents.dart';

class FillerToolbar extends StatelessWidget {
  const FillerToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FlutterDeckTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Actions.invoke(
            context,
            InsertFillerIntent(
              filler: getFillerText(),
              cause: SelectionChangedCause.toolbar,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              SecondaryColors.irisBlue,
            ),
          ),
          child: Text(
            'Insert filler',
            style: theme.textTheme.bodyLarge,
          ),
        )
      ],
    );
  }
}
