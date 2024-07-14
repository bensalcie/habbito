import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/core/common/constants/dimens.dart';
import 'package:habbito/core/common/presentation/widgets/app_shimmer_grid_vertical_loader.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_large.dart';
import 'package:habbito/core/common/presentation/widgets/app_textview_small.dart';
import 'package:habbito/core/common/utils/app_utils.dart';
import 'package:habbito/features/home/presentation/bloc/topic_recommendations_bloc.dart';
import 'package:habbito/features/home/presentation/widgets/topic_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppTextViewLarge(
          message: 'Habbito',
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
              BlocBuilder<TopicRecommendationsBloc, TopicRecommendationsState>(
                builder: (context, state) {
                  if (state is TopicRecommendationsSuccess) {
                    return const AppTextViewLarge(
                      message: 'How to avoid?',
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
              BlocBuilder<TopicRecommendationsBloc, TopicRecommendationsState>(
                builder: (context, state) {
                  if (state is TopicRecommendationsLoading) {
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
                  if (state is TopicRecommendationsFailed) {
                    return Center(
                      child: FloatingActionButton.extended(
                        onPressed: () => context
                            .read<TopicRecommendationsBloc>()
                            .add(const GetTopicRecommendations(
                                prompt: initialprompt)),
                        label: const AppTextViewSubtitleSmall(
                          text: 'Retry',
                          padding: 0,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  if (state is TopicRecommendationsSuccess) {
                    final topics = state.response;

                    List<String> topiclist = topics.split(',');

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 300, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final topic = topiclist[index]
                            .replaceAll('And', '')
                            .trim()
                            .capitalizeFirstLetter();

                        return TopicCard(
                          title: topic,
                          imageurl: imagelistdummy[index],
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
