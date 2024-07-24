part of 'add_habbit_bloc.dart';

class AddHabbitState extends Equatable {
  const AddHabbitState();

  @override
  List<Object> get props => [];
}

class AddHabbitInitial extends AddHabbitState {}

class AddHabbitLoading extends AddHabbitState {}

class AddHabbitSuccess extends AddHabbitState {
  final int response;

  const AddHabbitSuccess({required this.response});

  @override
  List<Object> get props => [response];
}

class AddHabbitFailed extends AddHabbitState {
  final String errorMessage;

  const AddHabbitFailed({required this.errorMessage});
}
