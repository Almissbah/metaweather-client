import 'package:flutter/foundation.dart';
import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart'; 
part 'forecast_api_service.g.dart';

@RestApi(baseUrl: "https://www.metaweather.com/api")
abstract class ForecastApiService {
  factory ForecastApiService(Dio dio) = _ForecastApiService;
 
  @GET("/location/{woeid}")
  Future<HttpResponse<ForecastApiResponse>> fetchWeatherForecast(
      {@required @Path("woeid") String woeid, });
}
