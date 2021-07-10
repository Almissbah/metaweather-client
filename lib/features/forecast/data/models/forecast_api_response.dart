import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_api_response.g.dart';

@JsonSerializable()
class ForecastApiResponse extends Equatable {
  @JsonKey(name: 'title')
  final String locationName;
  @JsonKey(name: 'location_type')
  final String locationType;

  @JsonKey(name: 'consolidated_weather')
  final List<DayForecastModel> daysForecast;
  ForecastApiResponse(
      {@required this.locationName,
      @required this.locationType,
      @required this.daysForecast});

  factory ForecastApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastApiResponseToJson(this);

  @override
  List<Object> get props => [locationName, locationType, daysForecast];
}

@JsonSerializable()
class DayForecastModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'weather_state_name')
  final String statusName;
  @JsonKey(name: 'weather_state_abbr')
  final String statusAbbreviation;
  @JsonKey(name: 'wind_direction_compass')
  final String compassDirection;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'the_temp')
  final double temp;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_direction')
  final double windDirection;
  @JsonKey(name: 'air_pressure')
  final double airPressure;
  @JsonKey(name: 'humidity')
  final double humidity;
  @JsonKey(name: 'applicable_date')
  final String date;

  DayForecastModel(
      {@required this.id,
      @required this.compassDirection,
      @required this.statusName,
      @required this.statusAbbreviation,
      @required this.windDirection,
      @required this.maxTemp,
      @required this.minTemp,
      @required this.temp,
      @required this.windSpeed,
      @required this.airPressure,
      @required this.date,
      @required this.humidity});

  factory DayForecastModel.fromJson(Map<String, dynamic> json) =>
      _$DayForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayForecastModelToJson(this);

  @override
  List<Object> get props => [
        this.id,
        this.statusName,
        this.statusAbbreviation,
        this.windDirection,
        this.maxTemp,
        this.minTemp,
        this.temp,
        this.windSpeed,
        this.airPressure,
        this.compassDirection,
        this.humidity
      ];
}
