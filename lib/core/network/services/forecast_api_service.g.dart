// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ForecastApiService implements ForecastApiService {
  _ForecastApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.metaweather.com/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<HttpResponse<ForecastApiResponse>> fetchWeatherForecast(
      {woeid}) async {
    ArgumentError.checkNotNull(woeid, 'woeid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/location/$woeid',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ForecastApiResponse.fromJson(_result.data);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
