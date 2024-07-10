import 'package:flutter/material.dart';

class AppDetailsRatingBar extends StatelessWidget {
  final double rating;
  const AppDetailsRatingBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = rating - fullStars >= 0.5;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              if (index < fullStars) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                );
              } else if (index == fullStars && hasHalfStar) {
                return const Icon(
                  Icons.star_half,
                  color: Colors.amber,
                  size: 20,
                );
              } else {
                return const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

// class AppDetailsRatingBar extends StatelessWidget {
//   final int rating;
//   const AppDetailsRatingBar({super.key, required this.rating});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(elements_padding),
//       child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: List.generate(5, (index) {
//             if (index < rating) {
//               return Icon(
//                 Icons.star,
//                 color: kProductDetailsRateStarColor,
//                 size: 20,
//               );
//             } else {
//               return Icon(
//                 Icons.star_border,
//                 color: kProductDetailsRateStarColor,
//                 size: 20,
//               );
//             }
//           }),
//         ),
//       ]),
//     );
//   }
// }
