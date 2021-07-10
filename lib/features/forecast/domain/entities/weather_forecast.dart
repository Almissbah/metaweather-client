import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class WeatherForecast extends Equatable {
  final String locationName;
  final String locationType;
  final List<DayForecast> daysForecasts;
  WeatherForecast(
      {@required this.locationName, @required this.locationType,@required this.daysForecasts});

  @override 
  List<Object> get props => [locationName,locationType,daysForecasts];
}

@immutable
class DayForecast  extends Equatable {
  final String status;
  final String abbreviation;
  final String date;
  final String compassDirection;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final double humidity;

  DayForecast(
      {@required this.status,
      @required this.abbreviation,
      @required this.date,
      @required this.compassDirection,
      @required this.minTemp,
      @required this.maxTemp,
      @required this.temp,
      @required this.windSpeed,
      @required this.windDirection,
      @required this.airPressure,
      @required this.humidity});

  @override 
  List<Object> get props => [status,
       abbreviation,
       date,
       compassDirection,
       minTemp,
       maxTemp,
       temp,
       windSpeed,
       windDirection,
       airPressure,
       humidity];
}
