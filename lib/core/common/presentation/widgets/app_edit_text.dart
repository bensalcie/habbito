import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/themes/theme.dart';

class AppEditText extends StatelessWidget {
  final TextInputType type;
  final bool isIcon;
  final IconData? icon;
  final bool? isReadOnly;
  final String? inputHint;
  final String? labelText;
  final bool? obscureText;

  final TextEditingController? controller;
  final Function? onTap;
  final double? padding;
  final TextStyle? textStyle;
  final double? marginTop;
  final String? initialValue;

  final bool? canRequestFocus;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  final bool? autofocus;

  const AppEditText(
      {super.key,
      this.isIcon = false,
      this.icon,
      this.obscureText,
      required this.type,
      this.canRequestFocus,
      this.controller,
      this.onTap,
      this.autofocus,
      this.padding,
      this.inputHint,
      this.isReadOnly,
      this.textStyle,
      this.marginTop,
      this.validator,
      this.onChanged,
      this.labelText,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: padding ?? 24,
        right: padding ?? 24,
      ),
      child: TextFormField(
        cursorColor: kDarkBannerColor,
        onChanged: (value) {
          onChanged != null ? onChanged!(value) : null;
        },
        onTap: () {
          isReadOnly == true && onTap != null ? onTap!() : null;
        },
        autofocus: autofocus ?? false,
        canRequestFocus: canRequestFocus ?? true,

        textInputAction: TextInputAction.done,
        // Set it to TextInputAction.done

        controller: controller,
        initialValue: initialValue,
        obscureText: obscureText ?? false,

        keyboardType: type,
        maxLines: type == TextInputType.multiline ? 3 : 1,
        readOnly: isReadOnly == true,
        validator: validator,
        style: textStyle ??
            TextStyle(
                color: kDarkBannerColor,
                fontSize: 17.0,
                fontFamily: app_font,
                fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: inputHint,

          labelText: labelText,
          hintStyle: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey), // Adjust size and color as needed

          focusColor: kTextInputBackgroundColor,
          prefixIcon: icon != null ? Icon(icon) : null,
          fillColor: kTextInputBackgroundColor,
          contentPadding: EdgeInsets.all(padding ?? 20),
          labelStyle: const TextStyle(
            color: Color(0xff979797),
            fontSize: 17.0,
            fontFamily: app_font,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              .copyWith(
            borderSide: BorderSide(
              color: kDarkBannerColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: kDarkBannerColor,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
