 
import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart';
import 'package:metaweather_client/features/forecast/data/models/weather_forecast_model.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';

class TestUtils {
  static WeatherForecast getWeatherForecast() {
    return WeatherForecast(daysForecasts: [],locationName:'London' ,locationType:'City' );
  }

 static WeatherForecastModel getWeatherForecastModel() {
    return WeatherForecastModel(daysForecasts: [],locationName:'London' ,locationType:'City' );
  }

    static ForecastApiResponse getForecastApiResponse() {
    return ForecastApiResponse(daysForecast: [],locationName:'London' ,locationType:'City' );
  }
     
}
