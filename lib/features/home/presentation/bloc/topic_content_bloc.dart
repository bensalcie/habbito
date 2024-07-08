import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_recommended_topics_usecase.dart';
import 'package:injectable/injectable.dart';

part 'topic_content_event.dart';
part 'topic_content_state.dart';

@injectable
class TopicContentBloc
    extends Bloc<TopicContentEvent, TopicContentState> {
  final GetRecommendedTopicsUseCase _topicContentUseCase;

  TopicContentBloc(this._topicContentUseCase)
      : super(TopicContentInitial()) {
    on<GetTopicContent>(_onGetTopicContent);
  }

  _onGetTopicContent(GetTopicContent event,
      Emitter<TopicContentState> emit) async {
    emit(TopicContentLoading());

    final result = await _topicContentUseCase.call(event.prompt);
    emit(
      result.fold(
        (failure) => const TopicContentFailed(
            errorMessage: 'Something went wrong'),
        (data) => TopicContentSuccess(response: data!),
      ),
    );
  }
}
