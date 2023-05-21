import '../../domain/core/errors/failures.dart';
import 'exceptions.dart';

extension ServerExceptionX on ServerException {
  Failure toFailure() {
    return Failure.serverFailure(message: errorMessage);
  }
}
