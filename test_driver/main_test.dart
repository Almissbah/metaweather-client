// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/keys/forecast_screen_keys.dart';
import 'package:metaweather_client/features/forecast/presentation/ui/keys/large_forecast_widget_keys.dart';
import 'package:test/test.dart';

import 'utils/my_driver.dart';

void main() {
  try {
    group('meta weather tests', () {
      FlutterDriver driver;
      MyTestDriver myDriver;

      // Connect to the Flutter driver before running any tests.
      setUpAll(() async {
        driver = await FlutterDriver.connect();
        myDriver = MyTestDriver(driver);
      });

      // Close the connection to the driver after the tests have completed.
      tearDownAll(() async {
        if (driver != null) {
          driver.close();
        }
      });

      test('test app is launching', () async {
        await myDriver.delay(1);
        await myDriver.waitFor(ForecastScreenKeys.SCAFOLD_KEY);
        await myDriver.expectPresent(ForecastScreenKeys.BLOC_LISTENER_KEY);
      });

      test('test forecast screen widget are present', () async {
        await myDriver.waitFor(ForecastScreenKeys.SCAFOLD_KEY);
        await myDriver.expectPresent(ForecastScreenKeys.BLOC_LISTENER_KEY);
        await myDriver
            .expectPresent(ForecastScreenKeys.LARGE_FORECAST_WIDGT_KEY);
            await myDriver
            .expectPresent(ForecastScreenKeys.FORECAST_LIST_KEY);  
        await myDriver
            .expectPresent(ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_0');
      });
      test('test displaying weather details when clicking list item', () async {
        await myDriver.delay(1);
        await myDriver
            .expectPresent(ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_1');
        await myDriver
            .expectPresent(ForecastScreenKeys.LARGE_FORECAST_WIDGT_KEY);
        await myDriver.tap(ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_1');
        
      });

      test('test pagination scrolling', () async {
        await myDriver.scrollToPosition(
            ForecastScreenKeys.FORECAST_LIST_KEY,
            ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_3');
        await myDriver.delay(1);
        await myDriver.expectPresent(
            ForecastScreenKeys.FORECAST_LIST_ITEM_PREFIX + '_3'); 
        await myDriver.delay(1);
      });
    });
  } catch (e, s) {
    print(s);
  }
}
