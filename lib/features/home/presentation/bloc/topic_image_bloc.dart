import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_recommended_topics_usecase.dart';
import 'package:injectable/injectable.dart';

part 'topic_image_event.dart';
part 'topic_image_state.dart';

@injectable
class TopicImageBloc extends Bloc<TopicImageEvent, TopicImageState> {
  final GetRecommendedTopicsUseCase _getRecommendedTopicsImageUseCase;

  TopicImageBloc(this._getRecommendedTopicsImageUseCase) : super(TopicImageInitial()) {
    on<GetTopicImage>(_onGetTopicImage);
  }

  _onGetTopicImage(
      GetTopicImage event, Emitter<TopicImageState> emit) async {
    emit(TopicImageLoading());

    final result = await _getRecommendedTopicsImageUseCase.call(event.prompt);
    emit(
      result.fold(
        (failure) =>
            const TopicImageFailed(errorMessage: 'Something went wrong'),
        (data) => TopicImageSuccess(response: data!),
      ),
    );
  }
}
