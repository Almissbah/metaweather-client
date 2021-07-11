import 'package:flutter_driver/driver_extension.dart';
import 'package:metaweather_client/main_mock.dart' as app;

Future<void> main() async {
  enableFlutterDriverExtension();
  app.main();
}
