part of 'get_habbits_bloc.dart';

class GetHabbitsState extends Equatable {
  const GetHabbitsState();

  @override
  List<Object> get props => [];
}

class GetHabbitsInitial extends GetHabbitsState {}

class GetHabbitsLoading extends GetHabbitsState {}

class GetHabbitsSuccess extends GetHabbitsState {
  final List<HabbitModel> habbits;

  const GetHabbitsSuccess({required this.habbits});

  @override
  List<Object> get props => [habbits];
}

class GetHabbitsFailed extends GetHabbitsState {
  final String errorMessage;

  const GetHabbitsFailed({required this.errorMessage});
}
