part of 'installment_form_bloc.dart';

@freezed
abstract class InstallmentFormState with _$InstallmentFormState {
  const factory InstallmentFormState({
    @required InstallmentItem installmentItem,
    @required bool isEditing,
    @required bool isSaving,
    @required bool showErrorMessages,
    @required Option<Either<InstallmentFailure, Unit>> submitResponseOption,
  }) = _InstallmentFormState;

  factory InstallmentFormState.initial() => InstallmentFormState(
        installmentItem: InstallmentItem.empty(),
        isEditing: false,
        isSaving: false,
        showErrorMessages: false,
        submitResponseOption: none(),
      );
}
