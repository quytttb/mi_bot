import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MarkdownText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: style,
        strong: style?.copyWith(fontWeight: FontWeight.bold),
        em: style?.copyWith(fontStyle: FontStyle.italic),
        code: style?.copyWith(
          fontFamily: 'monospace',
          backgroundColor: Colors.grey[200],
          fontSize: (style?.fontSize ?? 14) * 0.85,
        ),
        codeblockPadding: const EdgeInsets.all(8),
        codeblockDecoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4),
        ),
        blockquote: style?.copyWith(
          color: Colors.grey[700],
          fontStyle: FontStyle.italic,
        ),
        blockquoteDecoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.grey[400]!, width: 4)),
        ),
        h1: style?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: (style?.fontSize ?? 14) * 1.5,
        ),
        h2: style?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: (style?.fontSize ?? 14) * 1.35,
        ),
        h3: style?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: (style?.fontSize ?? 14) * 1.2,
        ),
        listBullet: style,
      ),
      selectable: true,
      softLineBreak: true,
    );
  }
}
