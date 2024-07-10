import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_recommended_topics_usecase.dart';
import 'package:injectable/injectable.dart';

part 'topic_recommendations_event.dart';
part 'topic_recommendations_state.dart';

@injectable
class TopicRecommendationsBloc
    extends Bloc<TopicRecommendationsEvent, TopicRecommendationsState> {
  final GetRecommendedTopicsUseCase _topicRecommendationsUseCase;

  TopicRecommendationsBloc(this._topicRecommendationsUseCase)
      : super(TopicRecommendationsInitial()) {
    on<GetTopicRecommendations>(_onGetRecommendedTopics);
  }

  _onGetRecommendedTopics(GetTopicRecommendations event,
      Emitter<TopicRecommendationsState> emit) async {
    emit(TopicRecommendationsLoading());

    try {
      final result = await _topicRecommendationsUseCase.call(event.prompt);
      emit(
        result.fold(
          (failure) => const TopicRecommendationsFailed(
              errorMessage: 'Something went wrong'),
          (data) => TopicRecommendationsSuccess(response: data!),
        ),
      );
    } catch (e) {
      emit(const TopicRecommendationsFailed(
          errorMessage: 'Something went wrong'));
    }
  }
}
