part of 'topic_image_bloc.dart';

class TopicImageEvent extends Equatable {
  const TopicImageEvent();

  @override
  List<Object> get props => [];
}

class GetTopicImage extends TopicImageEvent {
  final String imagename;
  final int position;
  const GetTopicImage({required this.imagename, required this.position});

  @override
  List<Object> get props => [imagename];
}

class GetTopicImages extends TopicImageEvent {
  final List<String> imagenames;
  const GetTopicImages({
    required this.imagenames,
  });

  @override
  List<Object> get props => [imagenames];
}
