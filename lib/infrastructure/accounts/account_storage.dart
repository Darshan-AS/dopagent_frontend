import 'package:dopagent_frontend/domain/accounts/account.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_storage.freezed.dart';
part 'account_storage.g.dart';

@freezed
abstract class AccountStorage implements _$AccountStorage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AccountStorage({
    @JsonKey(name: 'account_no') @required String accountNumber,
    @required String name,
    @required String openingDate,
    @required double denomination,
    @required double totalDepositAmount,
    @required int monthPaidUpto,
    @required String nextInstallmentDueDate,
    @required String dateOfLastDeposit,
    @required double rebatePaid,
    @required double defaultFee,
    @required int defaultInstallments,
    @required int pendingInstallments,
  }) = _AccountStorage;

  const AccountStorage._();

  factory AccountStorage.fromDomain(Account account) {
    return AccountStorage(
      accountNumber: account.accountNumber.getOrThrow(),
      name: account.name.getOrThrow(),
      openingDate: account.openingDate.getOrThrow().toString(),
      denomination: account.denomination.getOrThrow(),
      totalDepositAmount: account.totalDepositAmount.getOrThrow(),
      monthPaidUpto: account.monthPaidUpto.getOrThrow(),
      nextInstallmentDueDate:
          account.nextInstallmentDueDate.getOrThrow().toString(),
      dateOfLastDeposit: account.dateOfLastDeposit.getOrThrow().toString(),
      rebatePaid: account.rebatePaid.getOrThrow(),
      defaultFee: account.defaultFee.getOrThrow(),
      defaultInstallments: account.defaultInstallments.getOrThrow(),
      pendingInstallments: account.pendingInstallments.getOrThrow(),
    );
  }

  Account toDomain() {
    return Account(
      accountNumber: AccountNumber(accountNumber),
      name: Name(name),
      openingDate: Date(openingDate),
      denomination: Denomination(denomination),
      totalDepositAmount: UnsignedDouble(totalDepositAmount),
      monthPaidUpto: UnsignedInt(monthPaidUpto),
      nextInstallmentDueDate: Date(nextInstallmentDueDate),
      dateOfLastDeposit: Date(dateOfLastDeposit),
      rebatePaid: UnsignedDouble(rebatePaid),
      defaultFee: UnsignedDouble(defaultFee),
      defaultInstallments: UnsignedInt(defaultInstallments),
      pendingInstallments: UnsignedInt(pendingInstallments),
    );
  }

  factory AccountStorage.fromJson(Map<String, dynamic> json) =>
      _$AccountStorageFromJson(json);
}
