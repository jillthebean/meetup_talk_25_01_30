/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsExamplesGen {
  const $AssetsExamplesGen();

  /// File path: assets/examples/1983-Word_1.0.png
  AssetGenImage get a1983Word10 =>
      const AssetGenImage('assets/examples/1983-Word_1.0.png');

  /// File path: assets/examples/1985-1st_Word_Plus_3.0_screenshot.png
  AssetGenImage get a19851stWordPlus30Screenshot => const AssetGenImage(
      'assets/examples/1985-1st_Word_Plus_3.0_screenshot.png');

  /// File path: assets/examples/1987 - microsoft word 3.png
  AssetGenImage get a1987MicrosoftWord3 =>
      const AssetGenImage('assets/examples/1987 - microsoft word 3.png');

  /// File path: assets/examples/2002-OOo-1.1.4-Writer-Brief.png
  AssetGenImage get a2002OOo114WriterBrief =>
      const AssetGenImage('assets/examples/2002-OOo-1.1.4-Writer-Brief.png');

  /// File path: assets/examples/2004-Windows_CE_5.0_WordPad_in_Emulator.png
  AssetGenImage get a2004WindowsCE50WordPadInEmulator => const AssetGenImage(
      'assets/examples/2004-Windows_CE_5.0_WordPad_in_Emulator.png');

  /// File path: assets/examples/2007-Example_of_a_ribbon_(user_interface_element).png
  AssetGenImage get a2007ExampleOfARibbonUserInterfaceElement =>
      const AssetGenImage(
          'assets/examples/2007-Example_of_a_ribbon_(user_interface_element).png');

  /// File path: assets/examples/2025-google-docs.png
  AssetGenImage get a2025GoogleDocs =>
      const AssetGenImage('assets/examples/2025-google-docs.png');

  /// File path: assets/examples/2025-notion.webp
  AssetGenImage get a2025Notion =>
      const AssetGenImage('assets/examples/2025-notion.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        a1983Word10,
        a19851stWordPlus30Screenshot,
        a1987MicrosoftWord3,
        a2002OOo114WriterBrief,
        a2004WindowsCE50WordPadInEmulator,
        a2007ExampleOfARibbonUserInterfaceElement,
        a2025GoogleDocs,
        a2025Notion
      ];
}

class $AssetsFallbackGen {
  const $AssetsFallbackGen();

  /// File path: assets/fallback/context_menu_custom.png
  AssetGenImage get contextMenuCustom =>
      const AssetGenImage('assets/fallback/context_menu_custom.png');

  /// File path: assets/fallback/context_menu_default.png
  AssetGenImage get contextMenuDefault =>
      const AssetGenImage('assets/fallback/context_menu_default.png');

  /// List of all assets
  List<AssetGenImage> get values => [contextMenuCustom, contextMenuDefault];
}

class $AssetsMobileGen {
  const $AssetsMobileGen();

  /// File path: assets/mobile/github-mobile.png
  AssetGenImage get githubMobile =>
      const AssetGenImage('assets/mobile/github-mobile.png');

  /// File path: assets/mobile/swipe.png
  AssetGenImage get swipe => const AssetGenImage('assets/mobile/swipe.png');

  /// File path: assets/mobile/t9.png
  AssetGenImage get t9 => const AssetGenImage('assets/mobile/t9.png');

  /// File path: assets/mobile/threema_formatting.png
  AssetGenImage get threemaFormatting =>
      const AssetGenImage('assets/mobile/threema_formatting.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [githubMobile, swipe, t9, threemaFormatting];
}

class Assets {
  Assets._();

  static const $AssetsExamplesGen examples = $AssetsExamplesGen();
  static const $AssetsFallbackGen fallback = $AssetsFallbackGen();
  static const AssetGenImage me = AssetGenImage('assets/me.png');
  static const $AssetsMobileGen mobile = $AssetsMobileGen();
  static const AssetGenImage qrCode = AssetGenImage('assets/qr_code.png');

  /// List of all assets
  static List<AssetGenImage> get values => [me, qrCode];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
