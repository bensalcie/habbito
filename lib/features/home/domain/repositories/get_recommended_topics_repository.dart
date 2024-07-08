import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class GetRecommendedTopicsRepository {
  /// Get Recommended Topics
  /// [generateTopics]
  Future<Either<Failure, String?>> generateTopics({required String prompt});
}
