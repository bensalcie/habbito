import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/exceptions.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/features/personal/data/datasources/local/habbits_local_datasource.dart';
import 'package:habbito/features/personal/data/models/habbit_model.dart';
import 'package:habbito/features/personal/domain/repositories/habbits_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HabbitRepository)
class HabbitRepositoryImpl implements HabbitRepository {
  final HabbitLocalDataSource _habbitLocalDataSource;

  HabbitRepositoryImpl(this._habbitLocalDataSource);

  @override
  Future<Either<Failure, int>> addHabbit(
      {required HabbitModel habbitModel}) async {
    try {
      final res =
          await _habbitLocalDataSource.addHabbitItem(params: habbitModel);

      return Right(res);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteHabbit(
      {required HabbitModel habbitModel}) async {
    try {
      final res =
          await _habbitLocalDataSource.deleteHabbitItem(params: habbitModel);

      return Right(res);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<HabbitModel>?>> getHabbits() async {
    try {
      final List<HabbitModel> categoriesresponse =
          await _habbitLocalDataSource.getHabbitItems();

      return Right(categoriesresponse);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateHabbit(
      {required HabbitModel habbitModel}) async {
    try {
      final res =
          await _habbitLocalDataSource.updateHabbitItem(params: habbitModel);

      return Right(res);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteHabbits() async {
    try {
      final res = await _habbitLocalDataSource.deleteHabbitItems();

      return Right(res);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }
}
