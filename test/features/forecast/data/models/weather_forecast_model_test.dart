 

import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart';
import 'package:metaweather_client/features/forecast/data/models/weather_forecast_model.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
 
import '../../../../fixtures/utils.dart';

main() {
  ForecastApiResponse tImagesApiResponse;
  WeatherForecast tWeatherForecast;
  setUp(() {
    tImagesApiResponse = TestUtils.getForecastApiResponse();
    tWeatherForecast = TestUtils.getWeatherForecast();
  });

  test("should build WeatherForecastModel object from ForecastApiResponse", () {
    var result = WeatherForecastModel.fromApiResonse(tImagesApiResponse);
    expect(result, isA<WeatherForecast>());
    expect(result.props, equals(tWeatherForecast.props));
  });
}
