import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_shimmer_grid_vertical_loader.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/topics/presentation/bloc/topics_bloc.dart';
import 'package:habbito/features/topics/presentation/widgets/topics_card.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'Explore Topics',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(elements_small_padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: app_large_padding,
              ),
              BlocBuilder<TopicsBloc, TopicsState>(
                builder: (context, state) {
                  if (state is TopicsSuccess) {
                    return const AppTextViewLarge(
                      message: 'Live a healthy life',
                      fontSize: 22,
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(
                height: app_large_padding,
              ),
              BlocBuilder<TopicsBloc, TopicsState>(
                builder: (context, state) {
                  if (state is TopicsLoading) {
                    return AppShimmerGridVerticalLoader(
                      height: 200,
                      width: double.infinity,
                      borderRadius: 10,
                      isRounded: true,
                      itemCount: 15,
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      isCircular: true,
                    );
                  }
                  if (state is TopicsFailed) {
                    return Center(
                      child: FloatingActionButton.extended(
                        onPressed: () => context
                            .read<TopicsBloc>()
                            .add(const GetTopics(prompt: initialprompt)),
                        label: const AppTextViewSubtitleSmall(
                          text: 'Retry',
                          padding: 0,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (state is TopicsSuccess) {
                    final topics = state.response;

                    List<String> topiclist = topics.split('#');
                    topiclist.removeWhere((item) => item.isEmpty);

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final topic =
                            topiclist[index].trim().capitalizeFirstLetter();

                        final random = Random();
                        final randomindex =
                            random.nextInt(imagelistdummy.length);

                        return TopicsCard(
                          title: topic,
                          imageurl: imagelistdummy[randomindex],
                        );
                      },
                      itemCount: topiclist.length,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
