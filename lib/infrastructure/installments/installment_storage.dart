import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/domain/installments/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment_storage.freezed.dart';
part 'installment_storage.g.dart';

@freezed
abstract class InstallmentStorage implements _$InstallmentStorage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory InstallmentStorage({
    @required @JsonKey(name: 'account_no') String accountNumber,
    @required int noOfInstallments,
  }) = _InstallmentStorage;

  const InstallmentStorage._();

  factory InstallmentStorage.fromDomain(InstallmentItem installmentItem) {
    return InstallmentStorage(
      accountNumber: installmentItem.accountNumber.getOrThrow(),
      noOfInstallments: installmentItem.noOfInstallments.getOrThrow(),
    );
  }

  InstallmentItem toDomain() {
    return InstallmentItem(
      accountNumber: AccountNumber(accountNumber),
      noOfInstallments: NoOfInstallments(noOfInstallments),
    );
  }

  factory InstallmentStorage.fromJson(Map<String, dynamic> json) =>
      _$InstallmentStorageFromJson(json);
}
