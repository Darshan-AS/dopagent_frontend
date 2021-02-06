import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
abstract class Account implements _$Account {
  const factory Account({
    @required AccountNumber accountNumber,
    @required Name name,
    @required DateTime openingDate,
    @required Denomination denomination,
    @required UnsignedDouble totalDepositAmount,
    @required UnsignedInt monthPaidUpto,
    @required DateTime nextInstallmentDueDate,
    @required DateTime dateOfLastDeposit,
    @required UnsignedDouble rebatePaid,
    @required UnsignedDouble defaultFee,
    @required UnsignedInt defaultInstallments,
    @required UnsignedInt pendingInstallments,
  }) = _Account;

  const Account._();

  Option<ValueFailure<dynamic>> get failureOption {
    return accountNumber.getFailureOrUnit
        .andThen(name.getFailureOrUnit)
        .andThen(denomination.getFailureOrUnit)
        .andThen(totalDepositAmount.getFailureOrUnit)
        .andThen(monthPaidUpto.getFailureOrUnit)
        .andThen(rebatePaid.getFailureOrUnit)
        .andThen(defaultFee.getFailureOrUnit)
        .andThen(defaultInstallments.getFailureOrUnit)
        .andThen(pendingInstallments.getFailureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
