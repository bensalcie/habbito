part of 'topics_bloc.dart';

class TopicsEvent extends Equatable {
  const TopicsEvent();

  @override
  List<Object> get props => [];
}

class GetTopics extends TopicsEvent {
  final String prompt;
  const GetTopics({required this.prompt});

  @override
  List<Object> get props => [prompt];
}
