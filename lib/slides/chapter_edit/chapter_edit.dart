import 'package:flutter/widgets.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/context_menu/context_menu.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/shortcuts/shortcuts.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/text_display_edit_slide.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/toolbar/toolbar.dart';

final List<Widget> chapterEdit = [
  const TextDisplayEditSlide(),
  ...shortcutSlides,
  ...contextMenuSlides,
  ...toolbarSlides,
];
