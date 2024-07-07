import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/themes/theme.dart';


class AppLinearProgressIndicator extends StatelessWidget {
  final Color? backgroundcolor;
  final double? horizontalpadding;
  final double? minheight;
  final double? dotpercentage;
  final double? borderradius;
  const AppLinearProgressIndicator({
    super.key,
    this.backgroundcolor,
    this.horizontalpadding,
    this.minheight,
    this.dotpercentage,
    this.borderradius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalpadding ?? elements_padding),
      child: LinearProgressIndicator(
        value: dotpercentage ?? 0.0,
        borderRadius: BorderRadius.circular(borderradius ?? 50),
        valueColor:
            AlwaysStoppedAnimation<Color>(backgroundcolor ?? kPrimaryDark),
        backgroundColor: (backgroundcolor ?? kPrimaryDark).withOpacity(0.5),
        minHeight: minheight ?? 5,
      ),
    );
  }
}
