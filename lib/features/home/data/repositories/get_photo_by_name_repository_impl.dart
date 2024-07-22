import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/exceptions.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/features/home/data/datasources/get_photo_by_name_remote_datasource.dart';
import 'package:habbito/features/home/domain/repositories/get_photo_by_name_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: GetPhotoByNameRepository)
class GetPhotoByNameRepositoryImpl implements GetPhotoByNameRepository {
  final GetPhotoByNameRemoteDataSource _getRecommendedTopicsRemoteDataSource;

  GetPhotoByNameRepositoryImpl(this._getRecommendedTopicsRemoteDataSource);

  @override
  Future<Either<Failure, List<String>?>> getPhotos(
      {required List<String?> photonames}) async {
    try {
      final List<String> topics = await _getRecommendedTopicsRemoteDataSource
          .getPhotos(photonames: photonames);

      return Right(topics);
    } on ServerException {
      /// An error occurred of type server
      /// Probably some problem with the server.
      return Left(ServerFailure());
    }
  }
}
