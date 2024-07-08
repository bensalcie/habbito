part of 'topic_content_bloc.dart';

class TopicContentEvent extends Equatable {
  const TopicContentEvent();

  @override
  List<Object> get props => [];
}

class GetTopicContent extends TopicContentEvent {
  final String prompt;
  const GetTopicContent({required this.prompt});

  @override
  List<Object> get props => [prompt];
}
