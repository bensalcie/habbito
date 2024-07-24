import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/repositories/habbits_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddHabbitUsecase implements UseCase<int, HabbitModel> {
  final HabbitRepository _habbitRepository;

  AddHabbitUsecase(this._habbitRepository);

  @override
  Future<Either<Failure, int?>> call(HabbitModel habbit) async {
    return await _habbitRepository.addHabbit(habbitModel: habbit);
  }
}
