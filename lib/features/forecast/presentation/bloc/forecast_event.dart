part of 'forecast_bloc.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class LoadForecastEvent extends ForecastEvent {
  final String woeid;
  LoadForecastEvent({this.woeid});
}
