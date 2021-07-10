import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/core/errors/exceptions.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/core/network/network_info.dart';
import 'package:metaweather_client/features/forecast/data/datasources/forecast_remote_data_source.dart';
import 'package:metaweather_client/features/forecast/data/repositories/forecast_repository_impl.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/domain/usecases/get_weather_forecast.dart';
import 'package:mockito/mockito.dart';

class MockForecastRemoteDataSource extends Mock
    implements ForecastRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ForecastRepositoryImpl repository;
  MockForecastRemoteDataSource mockForecastRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockForecastRemoteDataSource = MockForecastRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ForecastRepositoryImpl(
        networkInfo: mockNetworkInfo,
        forecastRemoteDataSource: mockForecastRemoteDataSource);
  });

  final Params tParams = Params(woeid: '44418');
  final WeatherForecast tWeatherForecast = WeatherForecast(
      daysForecasts: [], locationName: 'Dubai', locationType: 'City');

  group("device is online", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return the WeatherForecast when the remote call is successfull',
        () async {
      //arrange
      when(mockForecastRemoteDataSource.getWeatherForecast(
              woeid: tParams.woeid))
          .thenAnswer((_) async => tWeatherForecast);

      //act
      final result = await repository.getForecast(woeid: tParams.woeid);

      //assert
      verify(mockForecastRemoteDataSource.getWeatherForecast(
          woeid: tParams.woeid));
      expect(result, equals(Right(tWeatherForecast)));
    });

    test('should return a failure when the remote call is unsuccessfull',
        () async {
      //arrange
      when(mockForecastRemoteDataSource.getWeatherForecast(
              woeid: tParams.woeid))
          .thenThrow(ServerException());

      //act
      final result = await repository.getForecast(woeid: tParams.woeid);

      //assert
      verify(mockForecastRemoteDataSource.getWeatherForecast(
          woeid: tParams.woeid));
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('should return a NoConnectionFailure if the device is offline',
        () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(false));

      //act
      final result = await repository.getForecast(woeid: tParams.woeid);

      //assert
      verifyZeroInteractions(mockForecastRemoteDataSource);
      expect(result, equals(Left(NoConnectionFailure())));
    });
  });
}
