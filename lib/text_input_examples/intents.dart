import 'package:flutter/widgets.dart';

class InsertFillerIntent extends Intent {
  const InsertFillerIntent({
    required this.filler,
    required this.cause,
  });
  final String filler;
  final SelectionChangedCause cause;
}

class ToggleBold extends Intent {
  const ToggleBold({
    required this.cause,
  });
  final SelectionChangedCause cause;
}
