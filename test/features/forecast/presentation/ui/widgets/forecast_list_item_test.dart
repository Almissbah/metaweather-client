import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/features/forecast/domain/entities/weather_forecast.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/keys/forecast_list_item_keys.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/widets/forecast_list_item.dart';

import '../../../../../fixtures/testable_widget_builder.dart';
import '../../../../../fixtures/utils.dart';

void main() {
  DayForecast dayForecast = TestUtils.getDayForecast();

  testWidgets('should display correct values.', (WidgetTester tester) async {
    //act
    await tester.pumpWidget(getTestableWidget(
      widget: ForecastListItem(
        dayForecast: dayForecast,
        unit: 'F',
      ),
    ));

    //assert
    expect(find.byKey(Key(ForecastListItemKeys.DAY_ABBR_KEY)), findsOneWidget); 
    expect(find.byKey(Key(ForecastListItemKeys.TEMP_TEXT_KEY)), findsOneWidget);

    expect(find.text('20/45 F'), findsOneWidget);
    expect(find.text('Mon'), findsOneWidget);
  });
}
