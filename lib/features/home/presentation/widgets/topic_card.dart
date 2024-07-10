import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/constants/routes.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/features/home/presentation/bloc/topic_image_bloc.dart';
import 'package:habbito/themes/theme.dart';

class TopicCard extends StatefulWidget {
  final String title;
  final String imageurl;
  const TopicCard({super.key, required this.title, required this.imageurl});

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .go(homepage_to_topic_details_page, extra: widget.title),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: BlocBuilder<TopicImageBloc, TopicImageState>(
          builder: (context, state) {
            var imageurl = widget.imageurl;
            if (state is TopicImageSuccess) {
              imageurl = state.response;
            }
            return Ink(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      imageurl), // Replace with your image URL
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), // Adjust opacity as needed
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: elements_large_padding),
                  child: AppTextViewMedium(
                    text: widget.title,
                    textColor: kLightColor,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
