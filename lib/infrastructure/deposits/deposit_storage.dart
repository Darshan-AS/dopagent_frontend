import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'deposit_storage.freezed.dart';
part 'deposit_storage.g.dart';

@freezed
class DepositStorage with _$DepositStorage {
  @HiveType(typeId: 1)
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DepositStorage({
    @JsonKey(ignore: true) @HiveField(0) String? id,
    @JsonKey(name: 'account_no') @HiveField(1) required String accountNumber,
    @HiveField(2) required int noOfInstallments,
  }) = _DepositStorage;

  const DepositStorage._();

  factory DepositStorage.fromDomain(Deposit deposit) {
    return DepositStorage(
      id: deposit.id.getOrThrow(),
      accountNumber: deposit.accountNumber.getOrThrow(),
      noOfInstallments: deposit.noOfInstallments.getOrThrow(),
    );
  }

  Deposit toDomain() {
    return Deposit(
      id: UniqueId.fromUniqueString(id),
      accountNumber: AccountNumber(accountNumber),
      noOfInstallments: NoOfInstallments(noOfInstallments),
    );
  }

  factory DepositStorage.fromJson(Map<String, dynamic> json) =>
      _$DepositStorageFromJson(json);
}
