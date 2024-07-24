import 'package:dartz/dartz.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';

import '../../../../core/error/failures.dart';

abstract class HabbitRepository {
  /// Get Habbits
  /// [getHabbits]
  Future<Either<Failure, List<HabbitModel>?>> getHabbits();

  /// [addHabbit]
  Future<Either<Failure, int>> addHabbit({required HabbitModel habbitModel});

  /// [deleteHabbit]

  Future<Either<Failure, bool>> deleteHabbit(
      {required HabbitModel habbitModel});

  /// [deleteHabbits]

  Future<Either<Failure, void>> deleteHabbits();

  /// [updateHabbit]

  Future<Either<Failure, void>> updateHabbit(
      {required HabbitModel habbitModel});
}
