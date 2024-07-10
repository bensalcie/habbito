import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_medium.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/home/presentation/bloc/topic_content_bloc.dart';
import 'package:habbito/features/home/presentation/bloc/topic_recommendations_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<TopicRecommendationsBloc, TopicRecommendationsState>(
              listener: (context, state) {
                if (state is TopicRecommendationsSuccess) {
                  final topics = state.response;

                  List<String> topiclist = topics.split(',');

                  topiclist.isNotEmpty
                      ? context.read<TopicContentBloc>().add(GetTopicContent(
                          prompt: 'How to avoid anything ${topiclist.first}'))
                      : null;
                }
              },
              child: BlocBuilder<TopicRecommendationsBloc,
                  TopicRecommendationsState>(
                builder: (context, state) {
                  if (state is TopicRecommendationsLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  if (state is TopicRecommendationsSuccess) {
                    final topics = state.response;

                    List<String> topiclist = topics.split(',');

                    return SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: topiclist.length,
                        itemBuilder: (context, index) {
                          final topic = topiclist[index];
                          return InkWell(
                            onTap: () {
                              context.read<TopicContentBloc>().add(GetTopicContent(
                                  prompt:
                                      'How to avoid anything $topic include atleast 3 links to accessible images  as comma separated'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                  label: AppTextViewMedium(
                                      text: topic.capitalizeFirstLetter(),
                                      textAlign: TextAlign.center)),
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),

            // Content Section.
            BlocBuilder<TopicContentBloc, TopicContentState>(
              builder: (context, state) {
                if (state is TopicContentLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }

                if (state is TopicContentSuccess) {
                  final content = state.response;
                  return Center(
                    child: AppTextViewSubtitleSmall(
                      text: content,
                      textAlign: TextAlign.start,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
