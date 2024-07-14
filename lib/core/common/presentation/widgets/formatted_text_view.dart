import 'package:flutter/material.dart';

class FormattedTextView extends StatelessWidget {
  final String text;

  const FormattedTextView({super.key, required this.text});

  List<TextSpan> parseText(String text) {
    List<TextSpan> spans = [];
    RegExp exp = RegExp(r'(\*\*.*?\*\*|\*.*?\*)');
    Iterable<RegExpMatch> matches = exp.allMatches(text);

    int lastMatchEnd = 0;

    for (RegExpMatch match in matches) {
      if (match.start > lastMatchEnd) {
        String precedingText = text.substring(lastMatchEnd, match.start);
        spans.addAll(_parseBulletPoints(precedingText));
      }

      String matchText = match.group(0)!;
      if (matchText.startsWith('**')) {
        spans.add(TextSpan(
          text: matchText.substring(2, matchText.length - 2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
      } else if (matchText.startsWith('*')) {
        spans.add(TextSpan(
          text: matchText.substring(1, matchText.length - 1),
          style: const TextStyle(fontStyle: FontStyle.italic),
        ));
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.addAll(_parseBulletPoints(text.substring(lastMatchEnd)));
    }

    return spans;
  }

  List<TextSpan> _parseBulletPoints(String text) {
    List<TextSpan> spans = [];
    List<String> lines = text.split('\n');

    for (String line in lines) {
      if (line.trim().startsWith('* ')) {
        spans.add(TextSpan(text: '• ${line.trim().substring(2)}\n'));
      } else {
        spans.add(TextSpan(text: '$line\n'));
      }
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 12.0),
        children: parseText(text),
      ),
    );
  }
}
