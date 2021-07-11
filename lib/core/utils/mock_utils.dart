import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';

class MockUtils {
  static WeatherForecast getWeatherForecast() {
    return WeatherForecast(daysForecasts: [
      DayForecast(
          abbreviation: 's',
          airPressure: 5,
          compassDirection: 'S',
          date: '2021-07-12',
          humidity: 21,
          imageUrl: 'https://www.metaweather.com/static/img/weather/s.svg',
          maxTemp: 45,
          minTemp: 20,
          status: 'Status',
          temp: 25,
          windDirection: 231,
          windSpeed: 10),
      DayForecast(
          abbreviation: 's',
          airPressure: 5,
          compassDirection: 'S',
          date: '2021-07-13',
          humidity: 21,
          imageUrl: 'https://www.metaweather.com/static/img/weather/s.svg',
          maxTemp: 45,
          minTemp: 20,
          status: 'Status',
          temp: 26,
          windDirection: 231,
          windSpeed: 10),
      DayForecast(
          abbreviation: 's',
          airPressure: 5,
          compassDirection: 'S',
          date: '2021-07-14',
          humidity: 21,
          imageUrl: 'https://www.metaweather.com/static/img/weather/s.svg',
          maxTemp: 45,
          minTemp: 20,
          status: 'Status',
          temp: 27,
          windDirection: 231,
          windSpeed: 10),
      DayForecast(
          abbreviation: 's',
          airPressure: 5,
          compassDirection: 'S',
          date: '2021-07-15',
          humidity: 21,
          imageUrl: 'https://www.metaweather.com/static/img/weather/s.svg',
          maxTemp: 45,
          minTemp: 20,
          status: 'Status',
          temp: 28,
          windDirection: 231,
          windSpeed: 10)
    ], locationName: 'London', locationType: 'City');
  }
}
