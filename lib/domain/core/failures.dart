import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String invalidValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required String invalidValue,
  }) = ShortPassword<T>;
}
