import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:habbito/core/common/data/datasources/remote/gemini_model_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModules {
  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Register the baseUrl String.
  @Named('BaseUrl')
  String get baseUrl => dotenv.env['PEXEL_BASE_URL']!;

  // Register the method channel for communication with platform code. Incase there will be any.

  @singleton
  MethodChannel get channel => const MethodChannel('app.habbito.bensalcie');

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));

  // Register Gemini API.
  @singleton
  @Named('ApiKey')
  String get apiKey => dotenv.env['GEMINI_API_KEY']!;

  @lazySingleton
  GenerativeModelService generativeModelService(
      @Named('ApiKey') String apiKey) {
    return GenerativeModelService(apiKey: apiKey);
  }
}
