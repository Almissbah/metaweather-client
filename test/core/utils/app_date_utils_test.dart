 import 'package:flutter_test/flutter_test.dart'; 
import 'package:metaweather_client/core/utils/app_date_utils.dart'; 

void main() {
  String tDate = '2021-07-12';
  group('app date utils', () {
    test('should return the corrent day of the week from date string',
        () async {
      //act
      final result = AppDateUtils.getDayOFweek(tDate);

      //assert
      expect(result, equals('Monday'));
    });

    test('should return the corrent day of the week abbr from date string',
        () async {
      //act
      final result = AppDateUtils.getAbbrDayName(tDate);

      //assert
      expect(result, equals('Mon'));
    });
  });
}
