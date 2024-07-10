part of 'topic_image_bloc.dart';

class TopicImageEvent extends Equatable {
  const TopicImageEvent();

  @override
  List<Object> get props => [];
}

class GetTopicImage extends TopicImageEvent {
  final String prompt;
  const GetTopicImage({required this.prompt});

  @override
  List<Object> get props => [prompt];
}
