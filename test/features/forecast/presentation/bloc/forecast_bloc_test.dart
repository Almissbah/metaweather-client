import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/features/forecast/domain/usecases/get_weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/bloc/forecast_bloc.dart';
import 'package:mockito/mockito.dart'; 

import '../../../../fixtures/utils.dart';

class MockGetWeatherForecast extends Mock implements GetWeatherForecast {}

void main() {
  ForecastBloc forecastBloc;
  MockGetWeatherForecast mockGetWeatherForecast;

  setUp(() {
    mockGetWeatherForecast = MockGetWeatherForecast();
    forecastBloc = ForecastBloc(mockGetWeatherForecast);
  });

  tearDown(() {
    forecastBloc.close();
  });
 

  test('should initial state equals to ForecastInitial', () async {
    //assert
    expect(forecastBloc.initialState, equals(ForecastInitial()));
  });

  group(
    'load forecast',
    () {
      test('should return an error if loading forecast is not successfull',
          () async {
        //arrange
        when(mockGetWeatherForecast(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        forecastBloc.getForecast();

        //assert
        expectLater(
          forecastBloc,
          emitsInOrder(
            [ForecastInitial(), ForecastLoading(), ForecastFailure("")],
          ),
        );
      });

      test(
        'should return WeatherForecast if request is successfull',
        () async {
          //arrange
          when(mockGetWeatherForecast(any))
              .thenAnswer((_) async => Right(TestUtils.getWeatherForecast()));

          //act
          forecastBloc.getForecast();

          //assert
          expectLater(
            forecastBloc,
            emitsInOrder(
              [
                ForecastInitial(),
                ForecastLoading(),
                ForecastSuccess(TestUtils.getWeatherForecast())
              ],
            ),
          );
        },
      );
    },
  );
}
