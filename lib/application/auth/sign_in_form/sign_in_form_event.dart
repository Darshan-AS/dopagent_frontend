part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormEvent with _$SignInFormEvent {
  const factory SignInFormEvent.emailChanged(String emailString) = EmailChanged;

  const factory SignInFormEvent.passwordChanged(String passwordString) =
      PasswordChanged;

  const factory SignInFormEvent.signUpWithEmail() = SignUpWithEmail;

  const factory SignInFormEvent.signInWithEmail() = SignInWithEmail;

  const factory SignInFormEvent.signInWithGoogle() = SignInWithGoogle;
}
