part of 'topic_image_bloc.dart';

class TopicImageState extends Equatable {
  const TopicImageState();

  @override
  List<Object> get props => [];
}

class TopicImageInitial extends TopicImageState {}

class TopicImageLoading extends TopicImageState {}

class TopicImageSuccess extends TopicImageState {
  final List<String> response;

  const TopicImageSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class TopicImageFailed extends TopicImageState {
  final String errorMessage;

  const TopicImageFailed({required this.errorMessage});
}
