import 'package:flutter/widgets.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_history/mobile_text_editing_slide.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_history/text_editing_elements.dart';
import 'package:meetup_talk_25_01_30/slides/chapter_history/word_processor_history_slide.dart';

final List<Widget> chapterHistory = [
  // const AgendaHistory(),
  WordProcessorHistorySlide(),
  MobileTextEditingSlide(),
  TextEditingElementsSlide(),
];
