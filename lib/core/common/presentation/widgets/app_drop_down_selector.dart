import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/themes/theme.dart';

import 'app_textview_input_title.dart';
import '../../constants/app_strings.dart';

class AppDropDownSelector extends StatelessWidget {
  final String? title;
  final List<String> dropdownItems;
  final ValueNotifier<String> firstItem;
  final TextEditingController? controller;
  final bool? hasPadding;
  final Function(String? newValue)? onChanged;
  final Color? textColor;

  const AppDropDownSelector(
      {super.key,
      required this.dropdownItems,
      required this.title,
      required this.firstItem,
      this.controller,
      this.onChanged,
      this.textColor,
      this.hasPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (hasPadding ?? true)
          ? const EdgeInsets.only(
              top: card_padding, left: app_padding, right: app_padding)
          : const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title != null
              ? AppTextViewInputTitle(
                  padding: (hasPadding ?? false) ? 12 : 0,
                  text: title!,
                  textAlign: TextAlign.start,
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 5,
          ),
          Ink(
            padding:
                const EdgeInsets.only(left: card_padding, right: card_padding),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kTextInputBackgroundColor),
            child: ValueListenableBuilder(
              valueListenable: firstItem,
              builder: (context, value, child) => DropdownButton<String>(
                underline: const SizedBox.shrink(),
                // Step 3.
                value: firstItem.value,
                isExpanded: true,

                alignment: Alignment.center,
                // Step 4.
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Ink(
                      child: Text(
                        value,
                        style: TextStyle(
                            color: textColor ?? kTextInputTextColor,
                            fontSize: 17.0,
                            fontFamily: app_font,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  controller?.text = newValue!;
                  firstItem.value = newValue ?? '';

                  onChanged != null ? onChanged!(newValue) : null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
