part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required Email email,
    required Password password,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authResponseOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        email: Email(''),
        password: Password(''),
        isSubmitting: false,
        showErrorMessages: false,
        authResponseOption: none(),
      );
}
