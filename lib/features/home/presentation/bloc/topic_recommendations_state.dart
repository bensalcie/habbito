part of 'topic_recommendations_bloc.dart';

class TopicRecommendationsState extends Equatable {
  const TopicRecommendationsState();

  @override
  List<Object> get props => [];
}

class TopicRecommendationsInitial extends TopicRecommendationsState {}

class TopicRecommendationsLoading extends TopicRecommendationsState {}

class TopicRecommendationsSuccess extends TopicRecommendationsState {
  final String response;

  const TopicRecommendationsSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class TopicRecommendationsFailed extends TopicRecommendationsState {
  final String errorMessage;

  const TopicRecommendationsFailed({required this.errorMessage});
}
