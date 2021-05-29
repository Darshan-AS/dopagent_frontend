part of 'deposit_form_bloc.dart';

@freezed
class DepositFormEvent with _$DepositFormEvent {
  const factory DepositFormEvent.initialize(
    Option<Deposit> optionDeposit,
  ) = _EditingDeposit;

  const factory DepositFormEvent.accountNumberChanged(
    String accountNumber,
  ) = _AccountNumberChanged;

  const factory DepositFormEvent.noOfInstallmentsChanged(
    String noOfInstallments,
  ) = _NoOfInstallmentsChanged;

  const factory DepositFormEvent.saved() = _Saved;

  const factory DepositFormEvent.deleted() = _Deleted;
}
