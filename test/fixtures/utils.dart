import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart';
import 'package:metaweather_client/features/forecast/data/models/weather_forecast_model.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';

class TestUtils {
  static WeatherForecast getWeatherForecast() {
    return WeatherForecast(
        daysForecasts: [], locationName: 'London', locationType: 'City');
  }

  static WeatherForecastModel getWeatherForecastModel() {
    return WeatherForecastModel(
        daysForecasts: [], locationName: 'London', locationType: 'City');
  }

  static ForecastApiResponse getForecastApiResponse() {
    return ForecastApiResponse(
        daysForecast: [], locationName: 'London', locationType: 'City');
  }

  static DayForecast getDayForecast() {
    return DayForecast(
        abbreviation: 's',
        airPressure: 5,
        compassDirection: 'S',
        date: '2021-07-12',
        humidity: 21,
        imageUrl: '',
        maxTemp: 45,
        minTemp: 20,
        status: 'Status',
        temp: 25,
        windDirection: 231,
        windSpeed: 10);
  }
}
