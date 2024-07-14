part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final String response;

  const ChatSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class ChatFailed extends ChatState {
  final String errorMessage;

  const ChatFailed({required this.errorMessage});
}
