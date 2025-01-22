import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:server/flutter_deck_state/cubit/flutter_deck_state_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
  print('incoming connection');
  final handler = webSocketHandler((channel, protocol) {
    final cubit = context.read<FlutterDeckStateCubit>()..subscribe(channel);
    print('web socket established');

    if (cubit.state != null) channel.sink.add(cubit.state);

    channel.stream.listen(
      (state) => cubit.update(state as String),
      onDone: () => cubit.unsubscribe(channel),
    );
  });

  return handler(context);
}
