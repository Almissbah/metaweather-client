import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

@module
abstract class PlatformModule {
  @preResolve
  DataConnectionChecker getDataConnectionChecker() {
    return DataConnectionChecker();
  }
}
