// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:flutter/services.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../core/common/data/datasources/local/storage_utils.dart' as _i7;
import '../core/common/data/datasources/remote/gemini_model_service.dart'
    as _i8;
import '../core/common/database/common/app_database.dart' as _i6;
import '../core/common/database/habbits/habbit_schedule_dao.dart' as _i9;
import '../core/common/database/habbits/habbits_dao.dart' as _i10;
import '../core/common/database/habbits/track_habbit_dao.dart' as _i11;
import '../core/network/dio_config.dart' as _i13;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i29;
import '../features/home/data/datasources/get_photo_by_name_remote_datasource.dart'
    as _i15;
import '../features/home/data/datasources/get_recommended_topics_datasource.dart'
    as _i16;
import '../features/home/data/repositories/get_photo_by_name_repository_impl.dart'
    as _i24;
import '../features/home/data/repositories/get_recommended_topics_repository_impl.dart'
    as _i18;
import '../features/home/domain/repositories/get_photo_by_name_repository.dart'
    as _i23;
import '../features/home/domain/repositories/get_recommended_topics_repository.dart'
    as _i17;
import '../features/home/domain/usecases/get_photo_by_name_usecase.dart'
    as _i28;
import '../features/home/domain/usecases/get_recommended_topics_usecase.dart'
    as _i21;
import '../features/home/presentation/bloc/topic_content_bloc.dart' as _i30;
import '../features/home/presentation/bloc/topic_image_bloc.dart' as _i34;
import '../features/home/presentation/bloc/topic_recommendations_bloc.dart'
    as _i22;
import '../features/personal/data/datasources/local/habbits_local_datasource.dart'
    as _i14;
import '../features/personal/data/repositories/habbits_repository_impl.dart'
    as _i20;
import '../features/personal/domain/repositories/habbits_repository.dart'
    as _i19;
import '../features/personal/domain/usecases/add_habbit_usecase.dart' as _i26;
import '../features/personal/domain/usecases/delete_habbit_usecase.dart'
    as _i27;
import '../features/personal/domain/usecases/get_habbits_usecase.dart' as _i25;
import '../features/personal/presentation/bloc/add_habbit_bloc.dart' as _i35;
import '../features/personal/presentation/bloc/delete_habbit_bloc.dart' as _i31;
import '../features/personal/presentation/bloc/get_habbits_bloc.dart' as _i33;
import '../features/personal/presentation/bloc/local_auth_bloc.dart' as _i4;
import '../features/topics/presentation/bloc/topics_bloc.dart' as _i32;
import 'module_injection.dart' as _i36;

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
    gh.lazySingleton<_i9.HabbitScheduleDao>(
        () => _i9.HabbitScheduleDao(gh<_i6.AppDatabase>()));
    gh.lazySingleton<_i10.HabbitsDao>(
        () => _i10.HabbitsDao(gh<_i6.AppDatabase>()));
    gh.lazySingleton<_i11.TrackHabbitDao>(
        () => _i11.TrackHabbitDao(gh<_i6.AppDatabase>()));
    gh.lazySingleton<_i12.Dio>(
        () => registerModules.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.lazySingleton<_i13.DioClient>(() => _i13.DioClient(gh<_i12.Dio>()));
    gh.lazySingleton<_i14.HabbitLocalDataSource>(
        () => _i14.HabbitLocalDataSourceImpl(
              gh<_i10.HabbitsDao>(),
              gh<_i9.HabbitScheduleDao>(),
              gh<_i11.TrackHabbitDao>(),
            ));
    gh.lazySingleton<_i15.GetPhotoByNameRemoteDataSource>(
        () => _i15.GetPhotoByNameRemoteDataSourceImpl(gh<_i13.DioClient>()));
    gh.lazySingleton<_i16.GetRecommendedTopicsRemoteDataSource>(() =>
        _i16.GetRecommendedTopicsRemoteDataSourceImpl(
            gh<_i8.GenerativeModelService>()));
    gh.lazySingleton<_i17.GetRecommendedTopicsRepository>(() =>
        _i18.GetRecommendedTopicsRepositoryImpl(
            gh<_i16.GetRecommendedTopicsRemoteDataSource>()));
    gh.lazySingleton<_i19.HabbitRepository>(
        () => _i20.HabbitRepositoryImpl(gh<_i14.HabbitLocalDataSource>()));
    gh.lazySingleton<_i21.GetRecommendedTopicsUseCase>(() =>
        _i21.GetRecommendedTopicsUseCase(
            gh<_i17.GetRecommendedTopicsRepository>()));
    gh.factory<_i22.TopicRecommendationsBloc>(() =>
        _i22.TopicRecommendationsBloc(gh<_i21.GetRecommendedTopicsUseCase>()));
    gh.lazySingleton<_i23.GetPhotoByNameRepository>(() =>
        _i24.GetPhotoByNameRepositoryImpl(
            gh<_i15.GetPhotoByNameRemoteDataSource>()));
    gh.lazySingleton<_i25.GetHabbitsUsecase>(
        () => _i25.GetHabbitsUsecase(gh<_i19.HabbitRepository>()));
    gh.lazySingleton<_i26.AddHabbitUsecase>(
        () => _i26.AddHabbitUsecase(gh<_i19.HabbitRepository>()));
    gh.lazySingleton<_i27.DeleteHabbitUsecase>(
        () => _i27.DeleteHabbitUsecase(gh<_i19.HabbitRepository>()));
    gh.lazySingleton<_i28.GetPhotoByNameUseCase>(
        () => _i28.GetPhotoByNameUseCase(gh<_i23.GetPhotoByNameRepository>()));
    gh.factory<_i29.ChatBloc>(
        () => _i29.ChatBloc(gh<_i21.GetRecommendedTopicsUseCase>()));
    gh.factory<_i30.TopicContentBloc>(
        () => _i30.TopicContentBloc(gh<_i21.GetRecommendedTopicsUseCase>()));
    gh.factory<_i31.DeleteHabbitBloc>(
        () => _i31.DeleteHabbitBloc(gh<_i27.DeleteHabbitUsecase>()));
    gh.factory<_i32.TopicsBloc>(
        () => _i32.TopicsBloc(gh<_i21.GetRecommendedTopicsUseCase>()));
    gh.factory<_i33.GetHabbitsBloc>(
        () => _i33.GetHabbitsBloc(gh<_i25.GetHabbitsUsecase>()));
    gh.factory<_i34.TopicImageBloc>(
        () => _i34.TopicImageBloc(gh<_i28.GetPhotoByNameUseCase>()));
    gh.factory<_i35.AddHabbitBloc>(
        () => _i35.AddHabbitBloc(gh<_i26.AddHabbitUsecase>()));
    return this;
  }
}

class _$RegisterModules extends _i36.RegisterModules {}
