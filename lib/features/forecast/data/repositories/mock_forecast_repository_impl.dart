import 'package:dartz/dartz.dart'; 
import 'package:injectable/injectable.dart'; 
import 'package:metaweather_client/core/utils/mock_utils.dart'; 
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/features/forecast/domain/repositories/forecast_repository.dart';

import '../../../../injection.dart';

@Singleton(as: ForecastRepository,env: [Env.test])
class MockForecastRepositoryImpl extends ForecastRepository {
 

  @override
  Future<Either<Failure, WeatherForecast>> getForecast({String woeid}) async {
    return Right(MockUtils.getWeatherForecast());
  }
}
