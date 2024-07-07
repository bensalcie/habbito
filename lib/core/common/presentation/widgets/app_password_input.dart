import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_subtitle.dart';
import 'package:habbito/themes/theme.dart';

import 'app_textview_input_title.dart';

// typedef void StringCallback(String text);

class AppPasswordInput extends StatefulWidget {
  final String inputLabel;
  final TextInputType type;
  final bool isIcon;
  final IconData? icon;
  final bool? isReadOnly;
  final String? inputHint;
  final TextEditingController? controller;
  final Function? onTap;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double? padding;
  final String? initialValue;

  const AppPasswordInput(
      {super.key,
      required this.inputLabel,
      this.isIcon = false,
      this.icon,
      required this.type,
      this.controller,
      this.onTap,
      this.inputHint,
      this.isReadOnly,
      this.onChanged,
      this.padding,
      this.onSaved,
      this.validator,
      this.initialValue});

  @override
  State<AppPasswordInput> createState() => _AppPasswordInputState();
}

class _AppPasswordInputState extends State<AppPasswordInput> {
  bool _obscureText = true;

  Widget inputIcon() {
    return widget.isIcon == false ? const Icon(null) : Icon(widget.icon);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextViewInputTitle(text: widget.inputLabel, padding: widget.padding),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: widget.padding ?? 24,
            right: widget.padding ?? 24,
          ),
          child: TextFormField(
            obscureText: _obscureText,
            onTap: () {
              widget.isReadOnly == true ? widget.onTap!() : null;
            },
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            validator: widget.validator,
            controller: widget.controller,
            keyboardType: widget.type,
            initialValue: widget.initialValue,
            maxLines: widget.type == TextInputType.multiline ? 3 : 1,
            readOnly: widget.isReadOnly == true,
            style: TextStyle(
                color: kTextInputTextColor,
                fontSize: 17.0,
                fontFamily: app_font,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                hintText: widget.inputHint,
                focusColor: kTextInputBackgroundColor,
                filled: true,
                fillColor: kTextInputBackgroundColor,
                contentPadding: const EdgeInsets.all(10.0),
                labelStyle: const TextStyle(
                  color: Color(0xff979797),
                  fontSize: 17.0,
                  fontFamily: app_font,
                  fontWeight: FontWeight.w500,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16))
                        .copyWith(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: kTextInputBackgroundColor,
                    width: 2.0,
                  ),
                ),
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AppTextViewSubtitle(
                          text: _obscureText ? 'Show' : 'Hide',
                          textAlign: TextAlign.center),
                    ))),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
