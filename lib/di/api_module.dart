import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metaweather_client/core/network/services/forecast_api_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart'; 

@module
abstract class ApiModule {
  @preResolve
  Dio getDio() {
    var dio = Dio();
     
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

  @preResolve
  ForecastApiService getShortlyApiService(Dio dio) {
    return ForecastApiService(dio);
  }
}
