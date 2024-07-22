import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class GetPhotoByNameRepository {
  /// Get getPhoto 
  /// [getPhotos]
  Future<Either<Failure, List<String>?>> getPhotos({required List<String?> photonames});
}
