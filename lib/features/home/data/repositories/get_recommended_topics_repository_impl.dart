import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/exceptions.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/features/home/data/datasources/get_recommended_topics_datasource.dart';
import 'package:habbito/features/home/domain/repositories/get_recommended_topics_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GetRecommendedTopicsRepository)
class GetRecommendedTopicsRepositoryImpl
    implements GetRecommendedTopicsRepository {
  final GetRecommendedTopicsRemoteDataSource
      _getRecommendedTopicsRemoteDataSource;

  GetRecommendedTopicsRepositoryImpl(
      this._getRecommendedTopicsRemoteDataSource);

  @override
  Future<Either<Failure, String?>> generateTopics(
      {required String prompt}) async {
    try {
      final String? topics = await _getRecommendedTopicsRemoteDataSource
          .generateTopics(prompt: prompt);

      return Right(topics);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }
}
