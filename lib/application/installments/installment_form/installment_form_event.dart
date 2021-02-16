part of 'installment_form_bloc.dart';

@freezed
abstract class InstallmentFormEvent with _$InstallmentFormEvent {
  const factory InstallmentFormEvent.initialize(
    Option<InstallmentItem> optionInstallment,
  ) = _EditingInstallment;

  const factory InstallmentFormEvent.accountNumberChanged(
    String accountNumber,
  ) = _AccountNumberChanged;

  const factory InstallmentFormEvent.noOfInstallmentsChanged(
    String noOfInstallments,
  ) = _NoOfInstallmentsChanged;

  const factory InstallmentFormEvent.saved() = _Saved;

  const factory InstallmentFormEvent.deleted() = _Deleted;
}
