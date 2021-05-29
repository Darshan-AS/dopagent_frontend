import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_failure.freezed.dart';

@freezed
class DepositFailure with _$DepositFailure {
  const factory DepositFailure.unexpected() = _Unexpected;
}
