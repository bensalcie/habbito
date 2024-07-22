// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:flutter/services.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../core/common/data/datasources/local/storage_utils.dart' as _i6;
import '../core/common/data/datasources/remote/gemini_model_service.dart'
    as _i7;
import '../core/network/dio_config.dart' as _i9;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i19;
import '../features/home/data/datasources/get_photo_by_name_remote_datasource.dart'
    as _i10;
import '../features/home/data/datasources/get_recommended_topics_datasource.dart'
    as _i11;
import '../features/home/data/repositories/get_photo_by_name_repository_impl.dart'
    as _i17;
import '../features/home/data/repositories/get_recommended_topics_repository_impl.dart'
    as _i13;
import '../features/home/domain/repositories/get_photo_by_name_repository.dart'
    as _i16;
import '../features/home/domain/repositories/get_recommended_topics_repository.dart'
    as _i12;
import '../features/home/domain/usecases/get_photo_by_name_usecase.dart'
    as _i18;
import '../features/home/domain/usecases/get_recommended_topics_usecase.dart'
    as _i14;
import '../features/home/presentation/bloc/topic_content_bloc.dart' as _i20;
import '../features/home/presentation/bloc/topic_image_bloc.dart' as _i22;
import '../features/home/presentation/bloc/topic_recommendations_bloc.dart'
    as _i15;
import '../features/personal/presentation/bloc/local_auth_bloc.dart' as _i4;
import '../features/topics/presentation/bloc/topics_bloc.dart' as _i21;
import 'module_injection.dart' as _i23;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.factory<_i4.LocalAuthBloc>(() => _i4.LocalAuthBloc());
    gh.singleton<_i5.MethodChannel>(() => registerModules.channel);
    gh.lazySingleton<_i6.StorageUtils>(
        () => _i6.StorageUtils(gh<_i3.SharedPreferences>()));
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<String>(
      () => registerModules.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i7.GenerativeModelService>(() => registerModules
        .generativeModelService(gh<String>(instanceName: 'ApiKey')));
    gh.lazySingleton<_i8.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i9.DioClient>(() => _i9.DioClient(gh<_i8.Dio>()));
    gh.lazySingleton<_i10.GetPhotoByNameRemoteDataSource>(
        () => _i10.GetPhotoByNameRemoteDataSourceImpl(gh<_i9.DioClient>()));
    gh.lazySingleton<_i11.GetRecommendedTopicsRemoteDataSource>(() =>
        _i11.GetRecommendedTopicsRemoteDataSourceImpl(
            gh<_i7.GenerativeModelService>()));
    gh.lazySingleton<_i12.GetRecommendedTopicsRepository>(() =>
        _i13.GetRecommendedTopicsRepositoryImpl(
            gh<_i11.GetRecommendedTopicsRemoteDataSource>()));
    gh.lazySingleton<_i14.GetRecommendedTopicsUseCase>(() =>
        _i14.GetRecommendedTopicsUseCase(
            gh<_i12.GetRecommendedTopicsRepository>()));
    gh.factory<_i15.TopicRecommendationsBloc>(() =>
        _i15.TopicRecommendationsBloc(gh<_i14.GetRecommendedTopicsUseCase>()));
    gh.lazySingleton<_i16.GetPhotoByNameRepository>(() =>
        _i17.GetPhotoByNameRepositoryImpl(
            gh<_i10.GetPhotoByNameRemoteDataSource>()));
    gh.lazySingleton<_i18.GetPhotoByNameUseCase>(
        () => _i18.GetPhotoByNameUseCase(gh<_i16.GetPhotoByNameRepository>()));
    gh.factory<_i19.ChatBloc>(
        () => _i19.ChatBloc(gh<_i14.GetRecommendedTopicsUseCase>()));
    gh.factory<_i20.TopicContentBloc>(
        () => _i20.TopicContentBloc(gh<_i14.GetRecommendedTopicsUseCase>()));
    gh.factory<_i21.TopicsBloc>(
        () => _i21.TopicsBloc(gh<_i14.GetRecommendedTopicsUseCase>()));
    gh.factory<_i22.TopicImageBloc>(
        () => _i22.TopicImageBloc(gh<_i18.GetPhotoByNameUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i23.RegisterModules {}
