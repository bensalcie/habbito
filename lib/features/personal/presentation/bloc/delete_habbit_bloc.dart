import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/usecases/delete_habbit_usecase.dart';
import 'package:injectable/injectable.dart';

part 'delete_habbit_event.dart';
part 'delete_habbit_state.dart';

@injectable
class DeleteHabbitBloc extends Bloc<DeleteHabbitEvent, DeleteHabbitState> {
  final DeleteHabbitUsecase _addHabbitUsecase;

  DeleteHabbitBloc(this._addHabbitUsecase) : super(DeleteHabbitInitial()) {
    on<DeleteHabbit>(_onDeleteHabbit);
  }

  _onDeleteHabbit(DeleteHabbit event, Emitter<DeleteHabbitState> emit) async {
    emit(DeleteHabbitLoading());
    final result = await _addHabbitUsecase.call(event.habbit);
    emit(
      result.fold(
        (failure) =>
            const DeleteHabbitFailed(errorMessage: 'Unable to add Habbit'),
        (data) => DeleteHabbitSuccess(response: data!),
      ),
    );
  }
}
