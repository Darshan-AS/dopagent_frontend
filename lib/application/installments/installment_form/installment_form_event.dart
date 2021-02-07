part of 'installment_form_bloc.dart';

@freezed
abstract class InstallmentFormEvent with _$InstallmentFormEvent {
  const factory InstallmentFormEvent.accountNumberChanged(
    String accountNumber,
  ) = _AccountNumberChanged;

  const factory InstallmentFormEvent.noOfInstallmentsChanged(
    int noOfInstallments,
  ) = _NoOfInstallmentsChanged;

  const factory InstallmentFormEvent.saved() = _Saved;
}