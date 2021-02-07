import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_validators.dart';

class AccountNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AccountNumber(String accountNumber) =>
      AccountNumber._(accountNumberValidator(accountNumber));

  const AccountNumber._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String name) => Name._(notEmptyValidator(name));

  const Name._(this.value);
}

class Denomination extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Denomination(double denomination) =>
      Denomination._(denominationValidator(denomination));

  const Denomination._(this.value);
}
