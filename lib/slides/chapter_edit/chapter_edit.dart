import 'package:flutter/widgets.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/shortcuts/shortcuts.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_edit/text_display_edit_slide.dart';

final List<Widget> chapterEdit = [
  const TextDisplayEditSlide(),
  ...shortcutSlides,
];
