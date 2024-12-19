# meetup_talk_25_01_30

My talk for the Flutter Offenburg meetup

## Rich Text Adventures

- introduction, whoami
- Rich Text Editor expectations
    - Classic example (Word, Libre Office, Markdown)
    - Real life use cases
- What is rich text?
- Definition of rich text
- Flavors of rich text (markdown, etc)
- introduction into flutter
- How to built a rich text editor in flutter
    - High level overview over simplistic editor from flutter examples
    - Quill.js approach with deltas
    - super_editor 
- Back to real life use cases
    - Pros and Cons depending on situation

Branding:
- https://zeroheight.com/7164c8587/p/44d6f7-introduction

Ressources:
- Quill https://quilljs.com/
- Flutter samples: https://github.com/flutter/samples/tree/main/simplistic_editor
- Flutter rich text:
    - https://api.flutter.dev/flutter/widgets/RichText-class.html
    - introduction https://github.com/GaryQian/flutter/commit/fb4dbf4584d02e90620a3cf25d195eb164a518bf#diff-173202728ade73a5056bd82211a25707fee6526534281d3835ed201cb02477edR37
- keyboard input history:
    - https://github.com/flutter/flutter/issues/33521
    - 2.8.0 https://github.com/flutter/flutter/pull/88477 for TextEditingDelta

packages:
- Flutter quill implemetation https://pub.dev/packages/flutter_quill
- AppFlowy https://pub.dev/packages/appflowy_editor
- SuperList OSS editor https://pub.dev/packages/super_editor

markdown packages:
- official flutter package https://pub.dev/packages/flutter_markdown
- official flutter package https://pub.dev/packages/markdown
- fork of flutter markdown https://pub.dev/packages/markd
- https://pub.dev/packages/markdown_widget
- markdown editor plus (rabbithole)
    - started by zahniar88 https://github.com/zahniar88/simple_markdown_editor
    - forked by fossfreaks https://github.com/fossfreaks/simple_markdown_editor
    - forked again by OmkarDabade https://github.com/OmkarDabade/markdown_editor_plus