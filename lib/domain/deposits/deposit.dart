import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/deposits/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit.freezed.dart';

@freezed
abstract class Deposit implements _$Deposit {
  const factory Deposit({
    @required UniqueId id,
    @required AccountNumber accountNumber,
    @required NoOfInstallments noOfInstallments,
    Date openingDate,
    Denomination denomination,
  }) = _Deposit;

  const Deposit._();

  factory Deposit.empty() => Deposit(
        id: UniqueId(),
        accountNumber: AccountNumber(''),
        noOfInstallments: NoOfInstallments(0),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return accountNumber.getFailureOrUnit
        .andThen(noOfInstallments.getFailureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
