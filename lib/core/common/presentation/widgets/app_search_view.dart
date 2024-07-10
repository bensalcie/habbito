import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/themes/theme.dart';

class AppSearchView extends StatelessWidget {
  final String? searchHint;
  final double? padding;
  final searchController = TextEditingController();
  final Function(String searchTerm) onSearchTermChanged;
  final Function()? onCancel;
  final bool? autoFocus;
  final Color? textInputBackground;
  final double? borderRadius;

  AppSearchView(
      {super.key,
      this.searchHint,
      required this.onSearchTermChanged,
      this.onCancel,
      this.borderRadius,
      this.textInputBackground,
      this.autoFocus,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(
              left: padding ?? 24,
              right: padding ?? 24,
            ),
            child: TextFormField(
              textInputAction:
                  TextInputAction.done, // Set it to TextInputAction.done

              controller: searchController,
              onChanged: (changedText) {
                if (changedText.length > 2) {
                  onSearchTermChanged(changedText);
                }
              },
              autofocus: autoFocus ?? false,

              keyboardType: TextInputType.text,
              maxLines: 1,
              cursorColor: kDarkBannerColor,

              style: TextStyle(
                  color: kDarkBannerColor,
                  fontSize: 17.0,
                  fontFamily: app_font,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: searchHint,
                focusColor: kTextInputBackgroundColor,
                prefixIcon: const Icon(Icons.search),
                fillColor: textInputBackground ?? kTextInputBackgroundColor,
                contentPadding: const EdgeInsets.all(10.0),
                labelStyle: const TextStyle(
                  color: Color(0xff979797),
                  fontSize: 17.0,
                  fontFamily: app_font,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadius ?? 16))
                    .copyWith(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        onCancel != null
            ? Expanded(
                flex: 1,
                child: AppTextViewSubtitleSmall(
                  onTap: () {
                    searchController.text = '';
                    onCancel!();
                  },
                  text: cancel,
                  textAlign: TextAlign.start,
                ))
            : const SizedBox.shrink(),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
