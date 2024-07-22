part of 'local_auth_bloc.dart';

class LocalAuthState extends Equatable {
  const LocalAuthState();

  @override
  List<Object> get props => [];
}

class LocalAuthInitial extends LocalAuthState {}

class LocalAuthLoading extends LocalAuthState {}

class LocalAuthSuccess extends LocalAuthState {
  final String response;

  const LocalAuthSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class LocalAuthFailed extends LocalAuthState {
  final String errorMessage;

  const LocalAuthFailed({required this.errorMessage});
}
