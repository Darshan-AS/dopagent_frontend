import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_failure.freezed.dart';

@freezed
abstract class AccountFailure with _$AccountFailure {
  const factory AccountFailure.unexpected() = _Unexpected;
}
