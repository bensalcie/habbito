import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:habbito/core/common/constants/app_strings.dart';
class GenerativeModelService {
  final GenerativeModel model;

  GenerativeModelService({required String apiKey})
      : model = GenerativeModel(
          model:geminipro,
          apiKey: apiKey,
        );

  Future<String?> generateContent(Iterable<Content> content) async {
    final response = await model.generateContent(content);
    return response.text;
  }
}