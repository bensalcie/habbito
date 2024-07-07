import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/themes/theme.dart';


class AppTextViewInputTitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final double? padding;
  final FontWeight? weight;
  final Color? textColor;
  final bool? isUnderLined;
  final Function()? onTap;

  const AppTextViewInputTitle(
      {super.key,
      required this.text,
      this.textAlign,
      this.padding,
      this.onTap,
      this.isUnderLined,
      this.weight,
      this.textColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTap != null ? onTap!() : null},
      child: Padding(
        padding: EdgeInsets.only(left: padding ?? 24, right: padding ?? 24),
        child: Text(text,
            textAlign: textAlign,
            style: TextStyle(
                fontFamily: app_font,
                decoration:
                    isUnderLined == true ? TextDecoration.underline : null,
                fontWeight: weight ?? FontWeight.w500,
                fontSize: 13,
                color: textColor ?? kInputTitleColor)),
      ),
    );
  }
}
