import 'package:dart_frog/dart_frog.dart';
import 'package:server/flutter_deck_state/middleware/flutter_deck_state_provider.dart';

Handler middleware(Handler handler) =>
    handler.use(flutterDeckStateCubitProvider);
