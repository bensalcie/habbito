import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:habbito/core/common/data/datasources/remote/gemini_model_service.dart';
import 'package:injectable/injectable.dart';

abstract class GetRecommendedTopicsRemoteDataSource {
  /// Call api to Get Home Views
  ///
  ///
  /// Throws a [ServerException] for all error codes.
  /// [generateTopics]
  Future<String?> generateTopics({required String prompt});
}

@LazySingleton(as: GetRecommendedTopicsRemoteDataSource)
class GetRecommendedTopicsRemoteDataSourceImpl
    implements GetRecommendedTopicsRemoteDataSource {
  final GenerativeModelService _generativeModelService;

  GetRecommendedTopicsRemoteDataSourceImpl(this._generativeModelService);

  @override
  Future<String?> generateTopics({required String prompt}) async {
    try {
      final content = [Content.text(prompt)];

      final response = await _generativeModelService.generateContent(content);

      if (kDebugMode) {
        print('Get Topics response: $response');
      }

      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Get Topics response: $e');
      }
      if (e is GenerativeAIException) {
        // Retry Request
        await generateTopics(prompt: prompt);

        // throw Exception(
        //     'Content generation was blocked due to safety concerns.');
      }
      rethrow;
    }
  }
}
