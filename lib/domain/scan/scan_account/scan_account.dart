import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_account.freezed.dart';

@freezed
abstract class ScanAccount implements _$ScanAccount {
  const factory ScanAccount({
    @required AccountNumber accountNumber,
    @required Name name,
    @required DateTime openingDate,
    @required Denomination denomination,
  }) = _ScanAccount;

  const ScanAccount._();

  Option<ValueFailure<dynamic>> get failureOption {
    return accountNumber.getFailureOrUnit
        .andThen(name.getFailureOrUnit)
        .andThen(denomination.getFailureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
