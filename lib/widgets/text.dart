import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  const SizedText(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);

    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            for (int i = 0; i < textSize.width / 5; i++)
              i.isEven
                  ? Container(
                      width: 5,
                      color: color,
                      height: 2,
                    )
                  : Container(
                      width: 5,
                      color: Colors.white,
                      height: 2,
                    ),
          ],
        ),
      ],
    );
  }

  Size _textSize(String text) {
    final TextPainter txt = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return txt.size;
  }
}
