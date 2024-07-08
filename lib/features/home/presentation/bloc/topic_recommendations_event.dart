part of 'topic_recommendations_bloc.dart';

class TopicRecommendationsEvent extends Equatable {
  const TopicRecommendationsEvent();

  @override
  List<Object> get props => [];
}

class GetTopicRecommendations extends TopicRecommendationsEvent {
  final String prompt;
  const GetTopicRecommendations({required this.prompt});

  @override
  List<Object> get props => [prompt];
}
