// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastApiResponse _$ForecastApiResponseFromJson(Map<String, dynamic> json) {
  return ForecastApiResponse(
    locationName: json['title'] as String,
    locationType: json['location_type'] as String,
    daysForecast: (json['consolidated_weather'] as List)
        ?.map((e) => e == null
            ? null
            : DayForecastModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastApiResponseToJson(
        ForecastApiResponse instance) =>
    <String, dynamic>{
      'title': instance.locationName,
      'location_type': instance.locationType,
      'consolidated_weather': instance.daysForecast,
    };

DayForecastModel _$DayForecastModelFromJson(Map<String, dynamic> json) {
  return DayForecastModel(
    id: json['id'] as int,
    compassDirection: json['wind_direction_compass'] as String,
    statusName: json['weather_state_name'] as String,
    statusAbbreviation: json['weather_state_abbr'] as String,
    windDirection: (json['wind_direction'] as num)?.toDouble(),
    maxTemp: (json['max_temp'] as num)?.toDouble(),
    minTemp: (json['min_temp'] as num)?.toDouble(),
    temp: (json['the_temp'] as num)?.toDouble(),
    windSpeed: (json['wind_speed'] as num)?.toDouble(),
    airPressure: (json['air_pressure'] as num)?.toDouble(),
    date: json['applicable_date'] as String,
    humidity: (json['humidity'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DayForecastModelToJson(DayForecastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.statusName,
      'weather_state_abbr': instance.statusAbbreviation,
      'wind_direction_compass': instance.compassDirection,
      'max_temp': instance.maxTemp,
      'min_temp': instance.minTemp,
      'the_temp': instance.temp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'applicable_date': instance.date,
    };
