part of 'topics_bloc.dart';

class TopicsState extends Equatable {
  const TopicsState();

  @override
  List<Object> get props => [];
}

class TopicsInitial extends TopicsState {}

class TopicsLoading extends TopicsState {}

class TopicsSuccess extends TopicsState {
  final String response;

  const TopicsSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class TopicsFailed extends TopicsState {
  final String errorMessage;

  const TopicsFailed({required this.errorMessage});
}
