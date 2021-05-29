part of 'deposit_form_bloc.dart';

@freezed
class DepositFormState with _$DepositFormState {
  const factory DepositFormState({
    required Deposit deposit,
    required bool isEditing,
    required bool isSaving,
    required bool showErrorMessages,
    required Option<Either<DepositFailure, Unit>> submitResponseOption,
  }) = _DepositFormState;

  factory DepositFormState.initial() => DepositFormState(
        deposit: Deposit.empty(),
        isEditing: false,
        isSaving: false,
        showErrorMessages: false,
        submitResponseOption: none(),
      );
}
