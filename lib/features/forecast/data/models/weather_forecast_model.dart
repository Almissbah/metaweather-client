import 'package:flutter/material.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'forecast_api_response.dart';

class WeatherForecastModel extends WeatherForecast {
  WeatherForecastModel(
      {@required String locationName,
      @required String locationType,
      @required List<DayForecast> daysForecasts})
      : super(
          locationName: locationName,
          locationType: locationType,
          daysForecasts: daysForecasts,
        );

  factory WeatherForecastModel.fromApiResonse(ForecastApiResponse response) {
    var daysForecastList = response.daysForecast
        .map((element) => DayForecast(
            imageUrl: _getImageUrl(element.statusAbbreviation),
            status: element.statusName,
            abbreviation: element.statusAbbreviation,
            date: element.date,
            compassDirection: element.compassDirection,
            minTemp: element.minTemp,
            maxTemp: element.maxTemp,
            temp: element.temp,
            windSpeed: element.windSpeed,
            windDirection: element.windDirection,
            airPressure: element.airPressure,
            humidity: element.humidity))
        .toList();
    return WeatherForecastModel(
        locationName: response.locationName,
        locationType: response.locationType,
        daysForecasts: daysForecastList);
  }

  static String _getImageUrl(String statusAbbreviation) {
    return 'https://www.metaweather.com/static/img/weather/$statusAbbreviation.svg';
  }
}
