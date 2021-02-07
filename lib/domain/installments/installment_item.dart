import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/installments/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment_item.freezed.dart';

@freezed
abstract class InstallmentItem implements _$InstallmentItem {
  const factory InstallmentItem({
    @required AccountNumber accountNumber,
    @required NoOfInstallments noOfInstallments,
    Date openingDate,
    Denomination denomination,
  }) = _InstallmentItem;

  const InstallmentItem._();

  factory InstallmentItem.empty() => InstallmentItem(
        accountNumber: AccountNumber(''),
        noOfInstallments: NoOfInstallments(1),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return accountNumber.getFailureOrUnit
        .andThen(noOfInstallments.getFailureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
