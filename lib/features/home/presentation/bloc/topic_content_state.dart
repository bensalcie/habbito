part of 'topic_content_bloc.dart';

class TopicContentState extends Equatable {
  const TopicContentState();

  @override
  List<Object> get props => [];
}

class TopicContentInitial extends TopicContentState {}

class TopicContentLoading extends TopicContentState {}

class TopicContentSuccess extends TopicContentState {
  final String response;

  const TopicContentSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class TopicContentFailed extends TopicContentState {
  final String errorMessage;

  const TopicContentFailed({required this.errorMessage});
}
