import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/home/domain/usecases/get_recommended_topics_usecase.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetRecommendedTopicsUseCase _ChatUseCase;

  ChatBloc(this._ChatUseCase) : super(ChatInitial()) {
    on<InitiateChat>(_onInvokeChat);
  }

  _onInvokeChat(
      InitiateChat event, Emitter<ChatState> emit) async {
    emit(ChatLoading());

    final result = await _ChatUseCase.call(event.prompt);
    emit(
      result.fold(
        (failure) =>
            const ChatFailed(errorMessage: 'Something went wrong'),
        (data) => ChatSuccess(response: data!),
      ),
    );
  }
}
