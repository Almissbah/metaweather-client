// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di/api_module.dart';
import 'core/network/services/forecast_api_service.dart';
import 'features/forecast/presentation/bloc/forecast_bloc.dart';
import 'features/forecast/data/datasources/forecast_remote_data_source.dart';
import 'features/forecast/domain/repositories/forecast_repository.dart';
import 'features/forecast/data/repositories/forecast_repository_impl.dart';
import 'features/forecast/domain/usecases/get_weather_forecast.dart';
import 'core/network/network_info.dart';
import 'di/platform_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final platformModule = _$PlatformModule();
  final apiModule = _$ApiModule();
  gh.factory<DataConnectionChecker>(
      () => platformModule.getDataConnectionChecker());
  gh.factory<Dio>(() => apiModule.getDio());
  gh.factory<ForecastApiService>(
      () => apiModule.getShortlyApiService(get<Dio>()));
  gh.factory<GetWeatherForecast>(
      () => GetWeatherForecast(forecastRepository: get<ForecastRepository>()));
  gh.factory<ForecastBloc>(() => ForecastBloc(get<GetWeatherForecast>()));

  // Eager singletons must be registered in the right order
  gh.singleton<ForecastRemoteDataSource>(ForecastRemoteDataSourceImpl(
      forecastApiService: get<ForecastApiService>()));
  gh.singleton<ForecastRepository>(ForecastRepositoryImpl(
      forecastRemoteDataSource: get<ForecastRemoteDataSource>(),
      networkInfo: get<NetworkInfo>()));
  return get;
}

class _$PlatformModule extends PlatformModule {}

class _$ApiModule extends ApiModule {}
