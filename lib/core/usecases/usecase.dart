import 'package:dartz/dartz.dart';
import 'package:metaweather_client/core/errors/failures.dart'; 

/// Callable class that represents the base usecase
/// every usecase should be a subtype of this class.
abstract class UseCase<Type, Params> {

  /// Accepts generic type [Params].
  /// Returns a [Future] of either a [Failure] or a [Type] in case of success.
  Future<Either<Failure, Type>> call(Params params);
}
