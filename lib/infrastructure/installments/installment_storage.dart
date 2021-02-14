import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/domain/installments/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'installment_storage.freezed.dart';
part 'installment_storage.g.dart';

@freezed
abstract class InstallmentStorage implements _$InstallmentStorage {
  @HiveType(typeId: 1)
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory InstallmentStorage({
    @JsonKey(ignore: true) @HiveField(0) String id,
    @required @JsonKey(name: 'account_no') @HiveField(1) String accountNumber,
    @required @HiveField(2) int noOfInstallments,
  }) = _InstallmentStorage;

  const InstallmentStorage._();

  factory InstallmentStorage.fromDomain(InstallmentItem installmentItem) {
    return InstallmentStorage(
      id: installmentItem.id.getOrThrow(),
      accountNumber: installmentItem.accountNumber.getOrThrow(),
      noOfInstallments: installmentItem.noOfInstallments.getOrThrow(),
    );
  }

  InstallmentItem toDomain() {
    return InstallmentItem(
      id: UniqueId.fromUniqueString(id),
      accountNumber: AccountNumber(accountNumber),
      noOfInstallments: NoOfInstallments(noOfInstallments),
    );
  }

  factory InstallmentStorage.fromJson(Map<String, dynamic> json) =>
      _$InstallmentStorageFromJson(json);
}
