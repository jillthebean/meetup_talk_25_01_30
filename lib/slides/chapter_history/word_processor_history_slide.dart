import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/gen/assets.gen.dart';

const _speakerNotes = '''
Text editing is already a very old topic - we won't even touch on
fonts here - but let's look at the some early iterations on text
editing with graphical user interfaces.


1983 - Microsoft Word: https://en.wikipedia.org/wiki/Microsoft_Word
1984 - Latex introduced itself https://en.wikipedia.org/wiki/LaTeX
1985 - 1stWord: https://en.wikipedia.org/wiki/1st_Word
1987 - Microsoft Word 3: https://winworldpc.com/product/microsoft-word/3x-mac
1987 - RTF 1.0 released https://en.wikipedia.org/wiki/Rich_Text_Format
1995 - Wordpad released
2002 - OpenOffice first release https://de.wikipedia.org/wiki/Apache_OpenOffice
2004 - Screenshot of wordpad https://en.wikipedia.org/wiki/WordPad
2007 - Plain toolbar reframed as ribbons by microsoft office 2007
Ribbon https://en.wikipedia.org/wiki/Ribbon_(computing)

Web:
2006 - Google Docs
2016 - Notion release



// Look at https://en.wikipedia.org/wiki/Word_processor
// https://en.wikipedia.org/wiki/Rich_Text_Format
// presentational markup https://en.wikipedia.org/wiki/Markup_language
// Ribbon https://en.wikipedia.org/wiki/Ribbon_(computing)

WYSIWYG started to establish itself pretty soon
Text formatting like alignment, italic, bold, headlines, size, font family
Later on images, different user experiences, more ways to do the same thinkg
Controversy of the microsoft word ribbons vs cluttered toolbars
Keyboard shortcuts for non mobile
Emphasis on toolbar evolution, mention some formats like HTML, RTF, LaTeX
''';

final _images = [
  Assets.examples.a1983Word10,
  Assets.examples.a19851stWordPlus30Screenshot,
  Assets.examples.a1987MicrosoftWord3,
  Assets.examples.a2002OOo114WriterBrief,
  Assets.examples.a2004WindowsCE50WordPadInEmulator,
  Assets.examples.a2007ExampleOfARibbonUserInterfaceElement,
  Assets.examples.a2025GoogleDocs,
  Assets.examples.a2025Notion,
];

class WordProcessorHistorySlide extends FlutterDeckSlideWidget {
  WordProcessorHistorySlide({
    super.key,
  }) : super(
          configuration: FlutterDeckSlideConfiguration(
              route: '/word-processor-history',
              steps: _images.length,
              speakerNotes: _speakerNotes),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsBuilder(builder: (context, step) {
      return FlutterDeckSlide.image(
        imageBuilder: (context) => _images[step-1].image(),
      );
    });
  }
}
