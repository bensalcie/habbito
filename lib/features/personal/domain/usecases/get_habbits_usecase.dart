import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/repositories/habbits_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHabbitsUsecase implements UseCase<List<HabbitModel>, NoParams> {
  final HabbitRepository _habbitRepository;

  GetHabbitsUsecase(this._habbitRepository);

  @override
  Future<Either<Failure, List<HabbitModel>?>> call(NoParams params) async {
    return await _habbitRepository.getHabbits();
  }
}
