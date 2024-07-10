import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
import 'package:habbito/di/injection.dart';
import 'package:habbito/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:habbito/features/home/presentation/bloc/topic_content_bloc.dart';
import 'package:habbito/features/home/presentation/bloc/topic_image_bloc.dart';
import 'package:habbito/features/home/presentation/bloc/topic_recommendations_bloc.dart';
import 'package:habbito/main.dart';

class BlocsRoot extends StatelessWidget {
  const BlocsRoot({
    super.key,
    required this.apptoken,
  });

  final String apptoken;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ChatBloc>()),
        BlocProvider(
            create: (context) => getIt<TopicRecommendationsBloc>()
              ..add(const GetTopicRecommendations(prompt: initialprompt))),
        BlocProvider(create: (context) => getIt<TopicContentBloc>()),
        BlocProvider(create: (context) => getIt<TopicImageBloc>()),
      ],
      child: MyApp(
        token: apptoken,
      ),
    );
  }
}
