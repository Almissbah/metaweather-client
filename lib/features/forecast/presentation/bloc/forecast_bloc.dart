import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:metaweather_client/core/errors/failures.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/domain/usecases/get_weather_forecast.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';


@injectable
class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  GetWeatherForecast _getWeatherForecast;
  ForecastBloc(this._getWeatherForecast);

  @override
  Stream<ForecastState> mapEventToState(
    ForecastEvent event,
  ) async* {
    if (event is LoadForecastEvent) {
      yield ForecastLoading();
      Either<Failure, WeatherForecast> result =
          await _getWeatherForecast(Params(woeid: event.woeid));

      yield* result.fold((failure) async* {
        yield ForecastFailure(failure.msg);
      }, (success) async* {
        yield ForecastSuccess(success);
      });
    }
  }

  @override
  ForecastState get initialState => ForecastInitial();

  getForecast() {
    add(LoadForecastEvent(woeid: '44418'));
  }
}
