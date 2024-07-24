import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/usecases/get_habbits_usecase.dart';
import 'package:injectable/injectable.dart';

part 'get_habbits_event.dart';
part 'get_habbits_state.dart';

@injectable
class GetHabbitsBloc extends Bloc<GetHabbitsEvent, GetHabbitsState> {
  final GetHabbitsUsecase _getHabbitsUsecase;

  GetHabbitsBloc(this._getHabbitsUsecase) : super(GetHabbitsInitial()) {
    on<GetHabbits>(_onGetGetHabbits);
  }

  _onGetGetHabbits(GetHabbits event, Emitter<GetHabbitsState> emit) async {
    emit(GetHabbitsLoading());
    final result = await _getHabbitsUsecase.call(NoParams());
    emit(
      result.fold(
        (failure) =>
            const GetHabbitsFailed(errorMessage: 'Unable to add Habbit'),
        (data) => GetHabbitsSuccess(habbits: data!),
      ),
    );
  }
}
