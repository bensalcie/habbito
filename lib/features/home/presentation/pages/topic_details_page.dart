import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_shimmer_vertical_loader.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/core/common/presentation/widgets/formatted_text_view.dart';
import 'package:habbito/features/home/presentation/bloc/topic_content_bloc.dart';

class TopicDetailsPage extends StatefulWidget {
  final String title;

  const TopicDetailsPage({super.key, required this.title});

  @override
  State<TopicDetailsPage> createState() => _TopicDetailsPageState();
}

class _TopicDetailsPageState extends State<TopicDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppTextViewLarge(
          padding: 0,
          message: widget.title,
          textAlign: TextAlign.start,
        ),
      ),
      body: BlocBuilder<TopicContentBloc, TopicContentState>(
        builder: (context, state) {
          if (state is TopicContentSuccess) {
            return Padding(
              padding: const EdgeInsets.all(app_padding),
              child: SingleChildScrollView(
                child: FormattedTextView(text: state.response),
              ),
            );
          }
          if (state is TopicContentLoading) {
            return AppShimmerVerticalLoader(
              height: 55,
              width: double.infinity,
              borderRadius: 10,
              isRounded: true,
              itemCount: 15,
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              isCircular: true,
            );
          }
          if (state is TopicContentFailed) {
            return const AppTextViewSubtitleSmall(
              text: 'No Content to Show',
              textAlign: TextAlign.start,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
