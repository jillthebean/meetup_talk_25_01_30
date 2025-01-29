import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_talk_25_01_30/gen/assets.gen.dart';

const _speakerNotes = '''
Text editing is already a very old topic - we won't even touch on
fonts here - but let's look at the some early iterations on text
editing interfaces.

1976 VI release

We can see the introduction with basic text user interfaces at the
start. These predate myself, but I think this is the reason why
we have "how to quit vim" memes today
1983 - Microsoft Word: https://en.wikipedia.org/wiki/Microsoft_Word

Also LaTeX needs a proper mention here, as it was conceived inn 1984
one year after the first release of microsoft word
1984 - Latex introduced itself https://en.wikipedia.org/wiki/LaTeX

One of the alternative to microsoft back then was 1st Word in 1985
as well as StarOffice - which was later aquired by Sun Microsystems
who then released it as OpenOffice with source code available
1985 - 1stWord: https://en.wikipedia.org/wiki/1st_Word

With microsft word 3, we start to see modern text editing interfaces
with WYSIWYG - What You See Is What You Get.
In the same year, microsoft published the RTF spec in version 1.0
In comparison, HTML would only be released several years later
1987 - Microsoft Word 3 (Mac Version): https://winworldpc.com/product/microsoft-word/3x-mac
1987 - RTF 1.0 released https://en.wikipedia.org/wiki/Rich_Text_Format

To get up to date, let's look at the 2000s with OpenOffice, WordPad and
the Microsoft Word in 2007 introducing "Ribbon" as a new take on toolbars
1995 - Wordpad released
2002 - OpenOffice first release https://de.wikipedia.org/wiki/Apache_OpenOffice
2004 - Screenshot of wordpad https://en.wikipedia.org/wiki/WordPad
2007 - Plain toolbar reframed as ribbons by microsoft office 2007
Ribbon https://en.wikipedia.org/wiki/Ribbon_(computing)

While we looked exclusively on the desktop side, here is a quick peek
at the web side of things. In 2006 Google Docs was released. 

Web:
2006 - Google Docs
2016 - Notion release
2021 - AppFlowy was released written in Flutter

We are here at a flutter talk, so let's round it up by looking also at
mobile platforms to round up the full support of what flutter offers us

// Look at https://en.wikipedia.org/wiki/Word_processor
// https://en.wikipedia.org/wiki/Rich_Text_Format
// presentational markup https://en.wikipedia.org/wiki/Markup_language
// Ribbon https://en.wikipedia.org/wiki/Ribbon_(computing)
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
