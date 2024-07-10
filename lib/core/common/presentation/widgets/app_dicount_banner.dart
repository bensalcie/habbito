import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/themes/theme.dart';

class AppDiscountBanner extends StatelessWidget {
  final double percentdiscount;
  final Color? bannerbackgroundcolor;
  final double? bannerpadding;
  final Color? textColor;
  const AppDiscountBanner(
      {super.key,
      required this.percentdiscount,
      this.bannerbackgroundcolor,
      this.bannerpadding,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(bannerpadding ?? elements_padding),
      decoration: BoxDecoration(
          color: bannerbackgroundcolor ?? kDiscountBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: Center(
          child: AppTextViewSubtitleSmall(
              padding: 0,
              fontSize: 8,
              textColor: textColor ?? kLightColor,
              text: '-${percentdiscount.toStringAsFixed(0)}% ',
              textAlign: TextAlign.center)),
    );
  }
}
