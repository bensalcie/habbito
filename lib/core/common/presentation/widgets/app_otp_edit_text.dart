import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/themes/theme.dart';


class AppOTPEditText extends StatelessWidget {
  final bool? isReadOnly;
  final TextEditingController controller;
  final Function? onTap;
  final Function(String changedValue)? onChanged;
  final FocusNode focusNode;

  final bool? autofocus;
  final double? paddingLeft;
  final double? paddingRight;
  const AppOTPEditText({
    super.key,
    required this.controller,
    this.onTap,
    this.isReadOnly,
    this.autofocus,
    this.paddingLeft,
    this.paddingRight,
    required this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: paddingLeft ?? 14,
            right: paddingRight ?? 14,
          ),
          child: TextFormField(
            maxLength: 1,
            onChanged: (value) {
              onChanged != null ? onChanged!(value) : null;
            },
            onTap: () {
              isReadOnly == true ? onTap!() : null;
            },
            showCursor: false,
            autofocus: autofocus ?? false,
            controller: controller,
            keyboardType: TextInputType.number,
            maxLines: 1,
            focusNode: focusNode,
            textAlign: TextAlign.center,
            readOnly: isReadOnly == true,
            style: TextStyle(
                color: kDarkBannerColor,
                fontSize: 17.0,
                fontFamily: app_font,
                fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              counterText: '',
              focusColor: kOTPInputViewBacColor,
              filled: true,
              fillColor: kOTPInputViewBacColor,
              contentPadding: const EdgeInsets.all(10.0),
              labelStyle: TextStyle(
                color: kOTPInputViewBacColor,
                fontSize: 17.0,
                fontFamily: app_font,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                  .copyWith(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: kOTPInputViewBacColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
