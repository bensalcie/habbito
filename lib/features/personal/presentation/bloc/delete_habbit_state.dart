part of 'delete_habbit_bloc.dart';

class DeleteHabbitState extends Equatable {
  const DeleteHabbitState();

  @override
  List<Object> get props => [];
}

class DeleteHabbitInitial extends DeleteHabbitState {}

class DeleteHabbitLoading extends DeleteHabbitState {}

class DeleteHabbitSuccess extends DeleteHabbitState {
  final bool response;

  const DeleteHabbitSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class DeleteHabbitFailed extends DeleteHabbitState {
  final String errorMessage;

  const DeleteHabbitFailed({required this.errorMessage});
}
