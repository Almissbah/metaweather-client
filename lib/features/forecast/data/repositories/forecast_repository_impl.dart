import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:metaweather_client/core/network/network_info.dart';
import 'package:metaweather_client/features/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/features/forecast/domain/repositories/forecast_repository.dart';

import '../../../../injection.dart';

@Singleton(as: ForecastRepository,env: [Env.prod])
class ForecastRepositoryImpl extends ForecastRepository {
  final ForecastRemoteDataSource forecastRemoteDataSource;
  final NetworkInfo networkInfo;

  ForecastRepositoryImpl(
      {@required this.forecastRemoteDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, WeatherForecast>> getForecast({String woeid}) async {
    if (await networkInfo.isConnected) {
      try {
        var result =
            await forecastRemoteDataSource.getWeatherForecast(woeid: woeid);

        return Right(result);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
