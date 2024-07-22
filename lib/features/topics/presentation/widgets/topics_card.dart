import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/constants/routes.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/features/home/presentation/bloc/topic_content_bloc.dart';
import 'package:habbito/themes/theme.dart';

class TopicsCard extends StatefulWidget {
  final String title;
  final int position;
  final String imageurl;
  const TopicsCard(
      {super.key,
      required this.title,
      required this.imageurl,
      required this.position});

  @override
  State<TopicsCard> createState() => _TopicsCardState();
}

class _TopicsCardState extends State<TopicsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<TopicContentBloc>().add(
            GetTopicContent(prompt: 'Give exhaustive ways to ${widget.title}'));

        GoRouter.of(context).go(topics_to_details_page, extra: widget.title);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Ink(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  widget.imageurl), // Replace with your image URL
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
              padding: const EdgeInsets.only(bottom: elements_large_padding),
              child: AppTextViewMedium(
                text: widget.title,
                fontSize: 17,
                textColor: kLightColor,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
