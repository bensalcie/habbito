import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_photo_by_name_usecase.dart';
import 'package:injectable/injectable.dart';

part 'topic_image_event.dart';
part 'topic_image_state.dart';

@injectable
class TopicImageBloc extends Bloc<TopicImageEvent, TopicImageState> {
  final GetPhotoByNameUseCase _getPhotoByNameUseCase;

  TopicImageBloc(this._getPhotoByNameUseCase) : super(TopicImageInitial()) {
    // on<GetTopicImage>(_onGetTopicImage);
    on<GetTopicImages>(_onGetTopicImages);
  }


    _onGetTopicImages(GetTopicImages event, Emitter<TopicImageState> emit) async {
    emit(TopicImageLoading());
    

    final result = await _getPhotoByNameUseCase.call(event.imagenames);
    emit(
      result.fold(
        (failure) =>
            const TopicImageFailed(errorMessage: 'Something went wrong'),
        (data) => TopicImageSuccess(response: data!),
      ),
    );
  }
}
