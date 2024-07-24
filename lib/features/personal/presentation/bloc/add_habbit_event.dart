part of 'add_habbit_bloc.dart';

class AddHabbitEvent extends Equatable {
  const AddHabbitEvent();

  @override
  List<Object> get props => [];
}

class AddHabbit extends AddHabbitEvent {
  final HabbitModel habbit;
  const AddHabbit({required this.habbit});

  @override
  List<Object> get props => [habbit];
}
