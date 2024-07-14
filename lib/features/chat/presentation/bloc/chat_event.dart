part of 'chat_bloc.dart';

class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class InitiateChat extends ChatEvent {
  final String prompt;
  const InitiateChat({required this.prompt});

  @override
  List<Object> get props => [prompt];
}
