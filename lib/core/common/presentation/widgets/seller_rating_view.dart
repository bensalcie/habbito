import 'package:flutter/material.dart';
import 'package:habbito/core/common/presentation/widgets/app_details_app_rating_bar.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_subtitle.dart';
import 'package:habbito/themes/theme.dart';


class SellerRatingView extends StatelessWidget {
  final int boughtcount;
  final double rating;
  final int reviewscount;

  const SellerRatingView(
      {super.key,
      required this.boughtcount,
      required this.rating,
      required this.reviewscount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppTextViewSubtitleSmall(
            weight: FontWeight.w800,
            padding: 0,
            text: boughtcount.toString(),
            textAlign: TextAlign.start),
        const AppTextViewSubtitleSmall(
            weight: FontWeight.w400,
            padding: 3,
            text: 'Bought here',
            textAlign: TextAlign.start),
        AppDetailsRatingBar(
          rating: rating,
        ),
        AppTextViewSubtitle(
          text: '$reviewscount Reviews',
          paddingleft: 2,
          fontSize: 10,
          textColor: kRatingCountTextColor,
          textAlign: TextAlign.start,
          weight: FontWeight.w400,
        )
      ],
    );
  }
}
