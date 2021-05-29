import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/auth/auth_failure.dart';
import 'package:dopagent_frontend/domain/auth/i_auth_facade.dart';
import 'package:dopagent_frontend/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_bloc.freezed.dart';
part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          email: Email(e.emailString),
          authResponseOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordString),
          authResponseOption: none(),
        );
      },
      signUpWithEmail: (e) async* {
        yield* _performAuthAction(_authFacade.signUpWithEmail);
      },
      signInWithEmail: (e) async* {
        yield* _performAuthAction(_authFacade.signInWithEmail);
      },
      signInWithGoogle: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authResponseOption: none(),
        );

        final authResponse = await _authFacade.signInWithGoogle();

        yield state.copyWith(
          isSubmitting: false,
          authResponseOption: some(authResponse),
        );
      },
    );
  }

  Stream<SignInFormState> _performAuthAction(
    Future<Either<AuthFailure, Unit>> Function({
      required Email email,
      required Password password,
    })
        authAction,
  ) async* {
    Either<AuthFailure, Unit>? authResponse;

    if (state.email.isValid() && state.password.isValid()) {
      yield state.copyWith(
        isSubmitting: true,
        authResponseOption: none(),
      );

      authResponse = await authAction(
        email: state.email,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authResponseOption: optionOf(authResponse),
    );
  }
}
