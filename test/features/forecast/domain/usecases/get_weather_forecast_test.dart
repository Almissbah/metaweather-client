import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:metaweather_client/features/forecast/domain/usecases/get_weather_forecast.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class MockForecastRepository extends Mock implements ForecastRepository {}

void main() {
  MockForecastRepository mockForecastRepository;
  GetWeatherForecast useCase;

  setUp(() {
    mockForecastRepository = MockForecastRepository();
    useCase = GetWeatherForecast(forecastRepository: mockForecastRepository);
  });

  final Params tParams = Params(woeid: '44418');
  final WeatherForecast tWeatherForecast = WeatherForecast(
      daysForecasts: [], locationName: 'Dubai', locationType: 'City');
  test(
      'should return a WeatherForecast object when requested with a valid params',
      () async {
    //arrange
    when(mockForecastRepository.getForecast(woeid: tParams.woeid))
        .thenAnswer((_) async => Right(tWeatherForecast));

    //act
    final result = await useCase(tParams);

    //assert
    expect(result, Right(tWeatherForecast));
    verify(mockForecastRepository.getForecast(woeid: tParams.woeid));
    verifyNoMoreInteractions(mockForecastRepository);
  });
}
