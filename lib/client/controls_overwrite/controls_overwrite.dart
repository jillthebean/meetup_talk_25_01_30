// ignore_for_file: implementation_imports

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_deck/src/controls/controls.dart';
import 'package:flutter_deck/src/controls/fullscreen/window_proxy/window_proxy.dart';
import 'package:flutter_deck/src/flutter_deck_router.dart';
import 'package:flutter_deck/src/presenter/presenter.dart';
import 'package:flutter_deck/src/theme/flutter_deck_theme_notifier.dart';
import 'package:flutter_deck/src/widgets/internal/internal.dart';
import 'package:flutter_deck_client/flutter_deck_client.dart';
import 'package:go_router/go_router.dart';

const _defaultLocale = Locale('en');

class AlwaysVisibleFlutterDeckControlsNotificer
    extends FlutterDeckControlsNotifier {
  AlwaysVisibleFlutterDeckControlsNotificer(
      {required super.autoplayNotifier,
      required super.drawerNotifier,
      required super.markerNotifier,
      required super.fullscreenManager,
      required super.router});

  @override
  bool get controlsVisible => true;
}

class AlwaysVisibleControlsFlutterDeckApp extends StatefulWidget {
  const AlwaysVisibleControlsFlutterDeckApp({
    required this.slides,
    this.isPresenterView,
    this.client,
    this.configuration = const FlutterDeckConfiguration(),
    this.speakerInfo,
    this.lightTheme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale = _defaultLocale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[_defaultLocale],
    super.key,
  });
  final FlutterDeckConfiguration configuration;
  final FlutterDeckClient? client;
  final List<Widget> slides;

  /// Information about the speaker.
  final FlutterDeckSpeakerInfo? speakerInfo;

  /// The theme to use when the app is in light mode.
  ///
  /// If not provided, the default [FlutterDeckThemeData.light] is used.
  final FlutterDeckThemeData? lightTheme;

  /// The theme to use when the app is in dark mode.
  ///
  /// If not provided, the default [FlutterDeckThemeData.dark] is used.
  final FlutterDeckThemeData? darkTheme;

  /// The theme mode to use.
  ///
  /// By default, the system theme mode is used.
  final ThemeMode themeMode;

  /// The initial locale for the slide deck. Defaults to English (Locale('en')).
  ///
  /// See also:
  /// * [MaterialApp.locale], which is equivalent to this argument.
  final Locale locale;

  /// The delegates for the slide deck's localization.
  ///
  /// See also:
  /// * [MaterialApp.localizationsDelegates], which is equivalent to this
  /// argument.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// The list of locales that the slide deck has been localized for. Defaults
  /// to English ([Locale('en')]).
  ///
  /// See also:
  /// * [MaterialApp.supportedLocales], which is equivalent to this argument.
  final Iterable<Locale> supportedLocales;

  /// Whether the app should run as a presenter view.
  ///
  /// This argument is only used on non-web platforms. On the web, the app will
  /// automatically determine if it should run as a presenter view based on the
  /// URL.
  final bool? isPresenterView;

  @override
  State<AlwaysVisibleControlsFlutterDeckApp> createState() => _FlutterDeckAppState();
}

class _FlutterDeckAppState extends State<AlwaysVisibleControlsFlutterDeckApp> {
  late FlutterDeckRouter _flutterDeckRouter;
  late GoRouter _router;

  late FlutterDeckAutoplayNotifier _autoplayNotifier;
  late FlutterDeckControlsNotifier _controlsNotifier;
  late FlutterDeckDrawerNotifier _drawerNotifier;
  late FlutterDeckLocalizationNotifier _localizationNotifier;
  late FlutterDeckMarkerNotifier _markerNotifier;
  late FlutterDeckPresenterController _presenterController;
  late FlutterDeckThemeNotifier _themeNotifier;

  @override
  void initState() {
    super.initState();

    _buildRouter();

    _autoplayNotifier = FlutterDeckAutoplayNotifier(router: _flutterDeckRouter);
    _drawerNotifier = FlutterDeckDrawerNotifier();
    _markerNotifier = FlutterDeckMarkerNotifier();
    _controlsNotifier = Platform.isAndroid && (widget.isPresenterView ?? false)
        ? AlwaysVisibleFlutterDeckControlsNotificer(
            autoplayNotifier: _autoplayNotifier,
            drawerNotifier: _drawerNotifier,
            markerNotifier: _markerNotifier,
            fullscreenManager: FlutterDeckFullscreenManager(WindowProxy()),
            router: _flutterDeckRouter,
          )
        : FlutterDeckControlsNotifier(
            autoplayNotifier: _autoplayNotifier,
            drawerNotifier: _drawerNotifier,
            markerNotifier: _markerNotifier,
            fullscreenManager: FlutterDeckFullscreenManager(WindowProxy()),
            router: _flutterDeckRouter,
          );
    _localizationNotifier = FlutterDeckLocalizationNotifier(
      locale: widget.locale,
      supportedLocales: widget.supportedLocales,
    );
    _themeNotifier = FlutterDeckThemeNotifier(widget.themeMode);
    _presenterController = FlutterDeckPresenterController(
      client: widget.client,
      controlsNotifier: _controlsNotifier,
      localizationNotifier: _localizationNotifier,
      markerNotifier: _markerNotifier,
      themeNotifier: _themeNotifier,
      router: _flutterDeckRouter,
    );

    if (widget.client != null && !(widget.isPresenterView ?? true)) {
      _presenterController.init();
    }
  }

  @override
  void dispose() {
    _presenterController.dispose();

    super.dispose();
  }

  bool _filterHidden(Widget slide) =>
      slide is! FlutterDeckSlideWidget ||
      !(slide.configuration?.hidden ?? false);

  FlutterDeckRouterSlide _buildRouterSlide((int, Widget) indexedSlide) {
    final (index, slide) = indexedSlide;
    final defaultConfiguration = FlutterDeckSlideConfiguration(
      route: '/slide-${index + 1}',
    );

    var slideWidget = slide;

    if (slideWidget is! FlutterDeckSlideWidget) {
      slideWidget = slide.withSlideConfiguration(defaultConfiguration);
    }

    final configuration = slideWidget.configuration ?? defaultConfiguration;

    return FlutterDeckRouterSlide(
      configuration: configuration.mergeWithGlobal(widget.configuration),
      route: configuration.route,
      widget: slideWidget,
    );
  }

  void _buildRouter() {
    final slides = widget.slides
        .where(_filterHidden)
        .indexed
        .map(_buildRouterSlide)
        .toList();

    _flutterDeckRouter = FlutterDeckRouter(slides: slides);
    _router = _flutterDeckRouter.build(isPresenterView: widget.isPresenterView);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _localizationNotifier,
      builder: (context, locale, _) => ValueListenableBuilder(
        valueListenable: _themeNotifier,
        builder: (context, themeMode, _) {
          final theme = context.darkModeEnabled(themeMode)
              ? widget.darkTheme ?? FlutterDeckThemeData.dark()
              : widget.lightTheme ?? FlutterDeckThemeData.light();

          return MaterialApp.router(
            routerConfig: _router,
            theme: theme.materialTheme,
            builder: (context, child) => FlutterDeck(
              configuration: widget.configuration,
              router: _flutterDeckRouter,
              speakerInfo: widget.speakerInfo,
              autoplayNotifier: _autoplayNotifier,
              controlsNotifier: _controlsNotifier,
              drawerNotifier: _drawerNotifier,
              localizationNotifier: _localizationNotifier,
              markerNotifier: _markerNotifier,
              presenterController: _presenterController,
              themeNotifier: _themeNotifier,
              child: FlutterDeckControlsListener(
                notifier: _controlsNotifier,
                child: FlutterDeckTheme(
                  data: theme,
                  child: child!,
                ),
              ),
            ),
            debugShowCheckedModeBanner: false,
            locale: locale,
            localizationsDelegates: widget.localizationsDelegates,
            supportedLocales: widget.supportedLocales,
          );
        },
      ),
    );
  }
}
