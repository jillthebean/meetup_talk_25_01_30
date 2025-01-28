import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/config/config.dart';

final flutterDeckConfig = FlutterDeckConfiguration(
  background: FlutterDeckBackgroundConfiguration(
    light: FlutterDeckBackground.gradient(BackgroundGradients.nightsky),
    dark: FlutterDeckBackground.gradient(BackgroundGradients.mountainDescend),
  ),
  controls: const FlutterDeckControlsConfiguration(
    presenterToolbarVisible: true,
    shortcuts: FlutterDeckShortcutsConfiguration(
      enabled: true,
      nextSlide: SingleActivator(LogicalKeyboardKey.arrowRight),
      previousSlide: SingleActivator(LogicalKeyboardKey.arrowLeft),
      toggleMarker: SingleActivator(
        LogicalKeyboardKey.keyM,
        control: true,
        meta: true,
      ),
      toggleNavigationDrawer: SingleActivator(
        LogicalKeyboardKey.period,
        control: true,
        meta: true,
      ),
    ),
  ),
  footer: const FlutterDeckFooterConfiguration(
    showSlideNumbers: true,
    widget: FlutterLogo(),
  ),
  header: const FlutterDeckHeaderConfiguration(
    showHeader: false,
  ),
  marker: const FlutterDeckMarkerConfiguration(
    color: Colors.cyan,
    strokeWidth: 8.0,
  ),
  progressIndicator: const FlutterDeckProgressIndicator.gradient(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.pink, Colors.purple],
    ),
    backgroundColor: Colors.black,
  ),
  slideSize: FlutterDeckSlideSize.fromAspectRatio(
    aspectRatio: const FlutterDeckAspectRatio.ratio16x10(),
    resolution: const FlutterDeckResolution.fromWidth(1440),
  ),
  transition: const FlutterDeckTransition.fade(),
);
