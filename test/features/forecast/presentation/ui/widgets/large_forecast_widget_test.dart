import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart'; 
import 'package:metaweather_client/features/forecast/presentation/ui/keys/large_forecast_widget_keys.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/large_forecast_widget.dart';

import '../../../../../fixtures/testable_widget_builder.dart';
import '../../../../../fixtures/utils.dart';

void main() {
  DayForecast dayForecast = TestUtils.getDayForecast();

  testWidgets('should display correct values.', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(getTestableWidget(
      widget: LargeForecastWidget(
        dayForecast: dayForecast,
        unit: 'F',
      ),
    ));

    //assert
    expect(
        find.byKey(Key(LargeForecastWidgetKeys.DAY_TEXT_KEY)), findsOneWidget);
    expect(
        find.byKey(Key(LargeForecastWidgetKeys.TEMP_TEXT_KEY)), findsOneWidget);
    expect(find.byKey(Key(LargeForecastWidgetKeys.STATUS_KEY)), findsOneWidget);
     expect(find.text(dayForecast.status), findsOneWidget);
    expect(find.text('${dayForecast.temp.toStringAsFixed(0)} F'), findsOneWidget);
    expect(find.text('Monday'), findsOneWidget);
  });
}
