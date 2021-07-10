import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// Abstract class to hide the implementation of the network connectivity checking.
abstract class NetworkInfo {
  /// returns `true` if the network is connected and `false` if not.
  Future<bool> get isConnected;
}

/// [NetworkInfo] implmentaion using [DataConnectionChecker] lib.
@Singleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfoImpl({@required this.dataConnectionChecker});

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
