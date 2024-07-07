import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/themes/theme.dart';

class BottomMenuIcon extends StatelessWidget {
  final bool isActive;
  final String assetsvgicon;
  final String iconlabel;
  const BottomMenuIcon(
      {super.key,
      required this.isActive,
      required this.assetsvgicon,
      required this.iconlabel});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: isActive
            ? kPrimaryDark
            : kPrimaryColor, // Apply the selected color to the active icon
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
      ),
      padding: const EdgeInsets.all(elements_small_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(assetsvgicon,
              semanticsLabel: iconlabel,
              colorFilter: isActive && iconlabel != home_label
                  ? ColorFilter.mode(kLightColor, BlendMode.srcIn)
                  : null),
          Text(iconlabel,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey,
                  fontFamily: app_font,
                  fontWeight: FontWeight.w600,
                  fontSize: 10))
        ],
      ),
    );
  }
}
