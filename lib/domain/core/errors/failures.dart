import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverFailure({required String message}) =
      ServerFailure;
  const factory Failure.unknown({required String message}) = UnknownFailure;
}
