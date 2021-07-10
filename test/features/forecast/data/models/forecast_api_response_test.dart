import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/features/forecast/data/models/forecast_api_response.dart'; 

import '../../../../fixtures/fixture_reader.dart';
import '../../../../fixtures/utils.dart';

main() {
  ForecastApiResponse response;
  setUp(() {
    response = TestUtils.getForecastApiResponse();
  });

  test("should parse ForecastApiResponse from json data", () {
    var result =
        ForecastApiResponse.fromJson(jsonDecode(fixture('sample_response_empty_list.json')));

    expect(result, equals(response));
  });
}
