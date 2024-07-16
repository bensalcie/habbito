import 'package:flutter/material.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small_no_tap.dart';
import 'package:habbito/features/about/data/models/sub_section_item.dart';
import 'package:habbito/themes/theme.dart';

class SectionCard extends StatelessWidget {
  final String sectiontitle;
  final List<SubSectionItem> subsections;

  const SectionCard(
      {super.key, required this.sectiontitle, required this.subsections});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextViewMedium(text: sectiontitle, textAlign: TextAlign.start),
        const SizedBox(
          height: app_padding,
        ),
        Card(
          color: kLightColor,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: subsections.length,
            itemBuilder: (context, index) {
              final item = subsections[index];
              return InkWell(
                onTap: () {
                  item.onClick();
                },
                child: Padding(
                  padding: const EdgeInsets.all(card_padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(item.subsectionlocalimage),
                      Expanded(
                        child: AppTextViewSubtitleSmallNoTap(
                            fontSize: 16,
                            text: item.subsectiontitle,
                            weight: FontWeight.w400,
                            textAlign: TextAlign.start),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: app_padding,
        ),
      ],
    );
  }
}
