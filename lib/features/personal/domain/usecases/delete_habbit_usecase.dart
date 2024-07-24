import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/repositories/habbits_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteHabbitUsecase implements UseCase<bool, HabbitModel> {
  final HabbitRepository _habbitRepository;

  DeleteHabbitUsecase(this._habbitRepository);

  @override
  Future<Either<Failure, bool?>> call(HabbitModel habbit) async {
    return await _habbitRepository.deleteHabbit(habbitModel: habbit);
  }
}
