import 'package:flutter/foundation.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:metaweather_client/core/usecases/usecase.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/domain/repositories/forecast_repository.dart';

class GetWeatherForecast extends UseCase<WeatherForecast, Params> {
  final ForecastRepository forecastRepository;

  GetWeatherForecast({@required this.forecastRepository});
  @override
  Future<Either<Failure, WeatherForecast>> call(Params params) {
    return forecastRepository.getForecast(woeid: params.woeid);
  }
}

class Params {
  /// Where On Earth ID
  final String woeid;

  Params({@required this.woeid});
}
