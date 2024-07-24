part of 'delete_habbit_bloc.dart';

class DeleteHabbitEvent extends Equatable {
  const DeleteHabbitEvent();

  @override
  List<Object> get props => [];
}

class DeleteHabbit extends DeleteHabbitEvent {
  final HabbitModel habbit;
  const DeleteHabbit({required this.habbit});

  @override
  List<Object> get props => [habbit];
}
