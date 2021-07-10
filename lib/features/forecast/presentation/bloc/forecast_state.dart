part of 'forecast_bloc.dart';

abstract class ForecastState extends Equatable {
  const ForecastState();
  
  @override
  List<Object> get props => [];
}

class ForecastInitial extends ForecastState {}
class ForecastLoading extends ForecastState {}
class ForecastSuccess extends ForecastState {
  final WeatherForecast weatherForecast;

  ForecastSuccess(this.weatherForecast);
}
class ForecastFailure extends ForecastState {
 final String msg;

  ForecastFailure(this.msg);
}