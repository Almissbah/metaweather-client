 
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/core/errors/exceptions.dart';
import 'package:metaweather_client/core/network/services/forecast_api_service.dart';
import 'package:metaweather_client/features/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart';
import 'package:metaweather_client/features/forecast/data/models/weather_forecast_model.dart';
import 'package:metaweather_client/features/forecast/domain/usecases/get_weather_forecast.dart';
import 'package:retrofit/retrofit.dart'; 

import '../../../../fixtures/fixture_reader.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/utils.dart';

class MockForecastApiService extends Mock implements ForecastApiService {}

void main() {
  MockForecastApiService mockForecastApiService;
  ForecastRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockForecastApiService = MockForecastApiService();
    dataSourceImpl =
        ForecastRemoteDataSourceImpl(forecastApiService: mockForecastApiService);
  });

  group('remote datasource', () {
    final Params tParams =
        Params(woeid: '212');
    final ForecastApiResponse tForecastApiResponse = TestUtils.getForecastApiResponse();

    final WeatherForecastModel tWeatherForecastModel = TestUtils.getWeatherForecastModel();
    test('should return the WeatherForecastModel object if the status code is 200',
        () async {
      //arrange
      when(mockForecastApiService.fetchWeatherForecast(woeid: tParams.woeid))
          .thenAnswer((_) async => HttpResponse(
              tForecastApiResponse,
              Response(
                  data: fixture('sample_response_empty_list.json'), statusCode: 200)));
      //act
      final result = await dataSourceImpl.getWeatherForecast(
          woeid: tParams.woeid);

      //assert
      verify(mockForecastApiService.fetchWeatherForecast(woeid: tParams.woeid));
      expect(result, equals(tWeatherForecastModel));
    });

    test('should throw an exception if the status code is not 200', () async {
      //arrange
    when(mockForecastApiService.fetchWeatherForecast(woeid: tParams.woeid))
          .thenAnswer((_) async => HttpResponse(
              tForecastApiResponse,
              Response(
                  data: fixture('sample_response_empty_list.json'), statusCode: 500)));

      //act
      final call = dataSourceImpl.getWeatherForecast;

      //assert
      expect(
          () => call(woeid: tParams.woeid),
          throwsA(isA<ServerException>()));
    });
  });
}
