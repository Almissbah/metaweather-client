 import 'package:flutter_test/flutter_test.dart';  
import 'package:metaweather_client/core/utils/tempreture_converter.dart'; 

void main() {
  double tempInC = 40;
   double tempInF = 104;
  test('should return the corrent F tempreture',
        () async {
      //act
      final result = TempretureConverter.convertCToF(tempInC);

      //assert
      expect(result, tempInF);
    });
}
