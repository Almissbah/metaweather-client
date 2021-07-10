import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';

abstract class ForecastRemoteDataSource {
  Future<WeatherForecast> getWeatherForecast({String woeid});
}
