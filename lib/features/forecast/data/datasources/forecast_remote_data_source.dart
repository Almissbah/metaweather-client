import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metaweather_client/core/errors/exceptions.dart';
import 'package:metaweather_client/core/network/services/forecast_api_service.dart';
import 'package:metaweather_client/features/forecast/data/models/weather_forecast_model.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';

abstract class ForecastRemoteDataSource {
  Future<WeatherForecast> getWeatherForecast({String woeid});
}

@Singleton(as:ForecastRemoteDataSource)
class ForecastRemoteDataSourceImpl extends ForecastRemoteDataSource {
  final ForecastApiService forecastApiService;

  ForecastRemoteDataSourceImpl({@required this.forecastApiService});
  @override
  Future<WeatherForecast> getWeatherForecast({String woeid}) async {
    var response = await forecastApiService.fetchWeatherForecast(woeid: woeid);

    if (response.response.statusCode == 200)
      return WeatherForecastModel.fromApiResonse(response.data);
    else {
      throw ServerException();
    }
  }
}
