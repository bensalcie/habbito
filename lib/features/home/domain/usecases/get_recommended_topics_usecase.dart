import 'package:dartz/dartz.dart';
import 'package:habbito/core/error/failures.dart';
import 'package:habbito/core/usecases/usecase.dart';
import 'package:habbito/features/home/domain/repositories/get_recommended_topics_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRecommendedTopicsUseCase implements UseCase<String, String> {
  final GetRecommendedTopicsRepository _getRecommendedTopicsRepository;

  GetRecommendedTopicsUseCase(this._getRecommendedTopicsRepository);

  @override
  Future<Either<Failure, String?>> call(String prompt) async {
    return await _getRecommendedTopicsRepository.generateTopics(prompt: prompt);
  }
}
