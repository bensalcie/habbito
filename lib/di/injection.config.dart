// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:flutter/services.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../core/common/data/datasources/local/storage_utils.dart' as _i7;
import '../core/common/data/datasources/remote/gemini_model_service.dart'
    as _i8;
import '../core/common/database/cart/habbits_dao.dart' as _i9;
import '../core/common/database/common/app_database.dart' as _i6;
import '../core/network/dio_config.dart' as _i11;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i27;
import '../features/home/data/datasources/get_photo_by_name_remote_datasource.dart'
    as _i13;
import '../features/home/data/datasources/get_recommended_topics_datasource.dart'
    as _i14;
import '../features/home/data/repositories/get_photo_by_name_repository_impl.dart'
    as _i22;
import '../features/home/data/repositories/get_recommended_topics_repository_impl.dart'
    as _i16;
import '../features/home/domain/repositories/get_photo_by_name_repository.dart'
    as _i21;
import '../features/home/domain/repositories/get_recommended_topics_repository.dart'
    as _i15;
import '../features/home/domain/usecases/get_photo_by_name_usecase.dart'
    as _i26;
import '../features/home/domain/usecases/get_recommended_topics_usecase.dart'
    as _i19;
import '../features/home/presentation/bloc/topic_content_bloc.dart' as _i28;
import '../features/home/presentation/bloc/topic_image_bloc.dart' as _i32;
import '../features/home/presentation/bloc/topic_recommendations_bloc.dart'
    as _i20;
import '../features/personal/data/datasources/local/habbits_local_datasource.dart'
    as _i12;
import '../features/personal/data/repositories/habbits_repository_impl.dart'
    as _i18;
import '../features/personal/domain/repositories/habbits_repository.dart'
    as _i17;
import '../features/personal/domain/usecases/add_habbit_usecase.dart' as _i23;
import '../features/personal/domain/usecases/delete_habbit_usecase.dart'
    as _i25;
import '../features/personal/domain/usecases/get_habbits_usecase.dart' as _i24;
import '../features/personal/presentation/bloc/add_habbit_bloc.dart' as _i33;
import '../features/personal/presentation/bloc/delete_habbit_bloc.dart' as _i29;
import '../features/personal/presentation/bloc/get_habbits_bloc.dart' as _i31;
import '../features/personal/presentation/bloc/local_auth_bloc.dart' as _i4;
import '../features/topics/presentation/bloc/topics_bloc.dart' as _i30;
import 'module_injection.dart' as _i34;

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
    gh.singleton<_i6.AppDatabase>(() => _i6.AppDatabase());
    gh.lazySingleton<_i7.StorageUtils>(
        () => _i7.StorageUtils(gh<_i3.SharedPreferences>()));
    gh.factory<String>(
      () => registerModules.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<String>(
      () => registerModules.apiKey,
      instanceName: 'ApiKey',
    );
    gh.lazySingleton<_i8.GenerativeModelService>(() => registerModules
        .generativeModelService(gh<String>(instanceName: 'ApiKey')));
    gh.lazySingleton<_i9.HabbitsDao>(
        () => _i9.HabbitsDao(gh<_i6.AppDatabase>()));
    gh.lazySingleton<_i10.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i11.DioClient>(() => _i11.DioClient(gh<_i10.Dio>()));
    gh.lazySingleton<_i12.HabbitLocalDataSource>(
        () => _i12.HabbitLocalDataSourceImpl(gh<_i9.HabbitsDao>()));
    gh.lazySingleton<_i13.GetPhotoByNameRemoteDataSource>(
        () => _i13.GetPhotoByNameRemoteDataSourceImpl(gh<_i11.DioClient>()));
    gh.lazySingleton<_i14.GetRecommendedTopicsRemoteDataSource>(() =>
        _i14.GetRecommendedTopicsRemoteDataSourceImpl(
            gh<_i8.GenerativeModelService>()));
    gh.lazySingleton<_i15.GetRecommendedTopicsRepository>(() =>
        _i16.GetRecommendedTopicsRepositoryImpl(
            gh<_i14.GetRecommendedTopicsRemoteDataSource>()));
    gh.lazySingleton<_i17.HabbitRepository>(
        () => _i18.HabbitRepositoryImpl(gh<_i12.HabbitLocalDataSource>()));
    gh.lazySingleton<_i19.GetRecommendedTopicsUseCase>(() =>
        _i19.GetRecommendedTopicsUseCase(
            gh<_i15.GetRecommendedTopicsRepository>()));
    gh.factory<_i20.TopicRecommendationsBloc>(() =>
        _i20.TopicRecommendationsBloc(gh<_i19.GetRecommendedTopicsUseCase>()));
    gh.lazySingleton<_i21.GetPhotoByNameRepository>(() =>
        _i22.GetPhotoByNameRepositoryImpl(
            gh<_i13.GetPhotoByNameRemoteDataSource>()));
    gh.lazySingleton<_i23.AddHabbitUsecase>(
        () => _i23.AddHabbitUsecase(gh<_i17.HabbitRepository>()));
    gh.lazySingleton<_i24.GetHabbitsUsecase>(
        () => _i24.GetHabbitsUsecase(gh<_i17.HabbitRepository>()));
    gh.lazySingleton<_i25.DeleteHabbitUsecase>(
        () => _i25.DeleteHabbitUsecase(gh<_i17.HabbitRepository>()));
    gh.lazySingleton<_i26.GetPhotoByNameUseCase>(
        () => _i26.GetPhotoByNameUseCase(gh<_i21.GetPhotoByNameRepository>()));
    gh.factory<_i27.ChatBloc>(
        () => _i27.ChatBloc(gh<_i19.GetRecommendedTopicsUseCase>()));
    gh.factory<_i28.TopicContentBloc>(
        () => _i28.TopicContentBloc(gh<_i19.GetRecommendedTopicsUseCase>()));
    gh.factory<_i29.DeleteHabbitBloc>(
        () => _i29.DeleteHabbitBloc(gh<_i25.DeleteHabbitUsecase>()));
    gh.factory<_i30.TopicsBloc>(
        () => _i30.TopicsBloc(gh<_i19.GetRecommendedTopicsUseCase>()));
    gh.factory<_i31.GetHabbitsBloc>(
        () => _i31.GetHabbitsBloc(gh<_i24.GetHabbitsUsecase>()));
    gh.factory<_i32.TopicImageBloc>(
        () => _i32.TopicImageBloc(gh<_i26.GetPhotoByNameUseCase>()));
    gh.factory<_i33.AddHabbitBloc>(
        () => _i33.AddHabbitBloc(gh<_i23.AddHabbitUsecase>()));
    return this;
  }
}

class _$RegisterModules extends _i34.RegisterModules {}
