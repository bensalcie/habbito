import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/usecases/add_habbit_usecase.dart';
import 'package:injectable/injectable.dart';

part 'add_habbit_event.dart';
part 'add_habbit_state.dart';

@injectable
class AddHabbitBloc extends Bloc<AddHabbitEvent, AddHabbitState> {
  final AddHabbitUsecase _addHabbitUsecase;

  AddHabbitBloc(this._addHabbitUsecase) : super(AddHabbitInitial()) {
    on<AddHabbit>(_onGetAddHabbit);
  }

  _onGetAddHabbit(AddHabbit event, Emitter<AddHabbitState> emit) async {
    emit(AddHabbitLoading());
    final result = await _addHabbitUsecase.call(event.habbit);
    emit(
      result.fold(
        (failure) =>
            const AddHabbitFailed(errorMessage: 'Unable to add Habbit'),
        (data) => AddHabbitSuccess(response: data!),
      ),
    );
  }
}
