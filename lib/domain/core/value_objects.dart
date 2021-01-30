import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/errors.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'Value: $value';

  bool isValid() => value.isRight();

  T getOrThrow({e = UnexpectedValueError}) => value.fold((f) => throw e(f), id);
}

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(right(Uuid().v1()));
  }
  const UniqueId._(this.value);

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(right(uniqueId));
  }
}
