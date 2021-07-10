import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart'; 

abstract class ForecastRepository {
  Future<Either<Failure, WeatherForecast>> getForecast(
      {@required String woeid});
}
