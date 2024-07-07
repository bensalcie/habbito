import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';

class SelectableTextView extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Function()? onClick;
  final Color? textColor;
  final double? padding;
  final FontWeight? weight;
  final double? fontSize;
  final double? paddingvertical;
  final FontStyle? fontStyle;

  const SelectableTextView(
      {super.key,
      required this.text,
      required this.textAlign,
      this.onClick,
      this.padding,
      this.weight,
      this.paddingvertical,
      this.fontSize,
      this.fontStyle,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: padding ?? 24,
          right: padding ?? 24,
          top: paddingvertical ?? 0,
          bottom: paddingvertical ?? 0.0),
      child: SelectableText(text,
          textAlign: textAlign,
          style: TextStyle(
              fontStyle: fontStyle,
              color: textColor,
              fontFamily: app_font,
              fontWeight: weight ?? FontWeight.bold,
              fontSize: fontSize ?? 18)),
    );
  }
}
