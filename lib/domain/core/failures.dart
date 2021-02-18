import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required T invalidValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required T invalidValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.invalidQrCode({
    @required T invalidValue,
  }) = InvalidQrCode<T>;

  const factory ValueFailure.invalidAccountNumber({
    @required T invalidValue,
  }) = InvalidAccountNumber<T>;

  const factory ValueFailure.emptyValue({
    @required T invalidValue,
  }) = EmptyValue<T>;

  const factory ValueFailure.negativeValue({
    @required T invalidValue,
  }) = NegativeValue<T>;

  const factory ValueFailure.invalidDate({
    @required T invalidValue,
  }) = InvalidDate<T>;

  const factory ValueFailure.invalidValue({
    @required T invalidValue,
  }) = InvalidValue<T>;

  const factory ValueFailure.invalidOpeningDate({
    @required T invalidValue,
  }) = InvalidOpeningDate<T>;

  const factory ValueFailure.invalidDenomination({
    @required T invalidValue,
  }) = InvalidDenomination<T>;
}
