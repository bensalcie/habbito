import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_recommended_topics_usecase.dart';
import 'package:injectable/injectable.dart';

part 'topics_event.dart';
part 'topics_state.dart';

@injectable
class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  final GetRecommendedTopicsUseCase _topicsUseCase;

  TopicsBloc(this._topicsUseCase) : super(TopicsInitial()) {
    on<GetTopics>(_onGetTopics);
  }

  _onGetTopics(GetTopics event, Emitter<TopicsState> emit) async {
    emit(TopicsLoading());

    final result = await _topicsUseCase.call(event.prompt);
    emit(
      result.fold(
        (failure) => const TopicsFailed(errorMessage: 'Something went wrong'),
        (data) => TopicsSuccess(response: data!),
      ),
    );
  }
}
