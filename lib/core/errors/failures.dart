import 'package:equatable/equatable.dart';

/// Every failure retruned by the all repositories should be a subtype of this class.
abstract class Failure extends Equatable {
  final String msg;

  Failure(this.msg);
  @override
  List<Object> get props => [msg];
}

/// Will be based in case of server failures.
class ServerFailure extends Failure {
  ServerFailure() : super("Server Error, Please try again !");
}

/// Will be passed in case of network failures.
class NoConnectionFailure extends Failure {
  NoConnectionFailure()
      : super(
            "Failed to connect, please check your internet connection and try again !");
}
