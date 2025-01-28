import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

// Look at https://en.wikipedia.org/wiki/Word_processor
// https://en.wikipedia.org/wiki/Rich_Text_Format
// presentational markup https://en.wikipedia.org/wiki/Markup_language
// Ribbon https://en.wikipedia.org/wiki/Ribbon_(computing)
class WordProcessorHistorySlide extends FlutterDeckSlideWidget {
  const WordProcessorHistorySlide({
    super.key,
  }) : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/word-processor-history',
            steps: 9,
            speakerNotes:
'''
Different word processors to show the evolution of increased features
WYSIWYG (when?)
Text formatting like alignment, italic, bold, headlines, size, font family
Later on images, different user experiences, more ways to do the same thinkg
Controversy of the microsoft word ribbons vs cluttered toolbars
Keyboard shortcuts for non mobile
Emphasis on toolbar evolution, mention some formats like HTML, RTF, LaTeX
'''
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          '<Image of a word processor device or typewriter>',
          '<Image of Microsoft Word 2>',
          '<Image of ancient web page>',
          '<Image of modern libre office>',
          '<Image of LaTex>',
          '<Image of Notion>',
          '<Image of GitHub PR Form>',
          '<Image of Jira Ticket creation>',
          '<Image of Microsoft Word today with ribbons>',
        ],
      ),
    );
  }
}
