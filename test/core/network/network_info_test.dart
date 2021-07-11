import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:metaweather_client/core/network/network_info.dart';

import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfoImpl;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfoImpl =
        NetworkInfoImpl(dataConnectionChecker: mockDataConnectionChecker);
  });

  group('network info', () {
    test(
        'should return true if the network is connected',
        () async {
      //arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => true);
      //act
      final result =
          await networkInfoImpl.isConnected;

      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, equals(true));
    });

   test(
        'should return false if the network is not connected',
        () async {
      //arrange
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => false);
      //act
      final result =
          await networkInfoImpl.isConnected;

      //assert
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, equals(false));
    });
  });
}
