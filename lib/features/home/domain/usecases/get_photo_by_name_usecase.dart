import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/home/domain/repositories/get_photo_by_name_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotoByNameUseCase implements UseCase<List<String>, List<String>> {
  final GetPhotoByNameRepository _getRecommendedTopicsRepository;

  GetPhotoByNameUseCase(this._getRecommendedTopicsRepository);

  @override
  Future<Either<Failure, List<String>?>> call(List<String> photonames) async {
    return await _getRecommendedTopicsRepository.getPhotos(
        photonames: photonames);
  }
}
