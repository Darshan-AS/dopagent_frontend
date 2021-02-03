import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dopagent_frontend/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) => state.authResponseOption.fold(
        () {},
        (either) => either.fold(
          (failure) => FlushbarHelper.createError(
            message: failure.when(
                cancelledByUser: () => "Cancelled",
                serverError: () => "Server Error",
                emailAlreadyInUse: () => "Email already in use",
                invalidEmailOrPassword: () => "Invalid Email or Password"),
          ).show(context),
          (_) => {
            // TODO: Navigate
          },
        ),
      ),
      builder: (context, state) => Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: ListView(
          children: [
            const Text(
              '💰',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 130),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
              autocorrect: false,
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.emailChanged(value)),
              validator: (_) =>
                  context.read<SignInFormBloc>().state.email.value.fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => 'Invalid Email',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => context
                  .read<SignInFormBloc>()
                  .add(SignInFormEvent.passwordChanged(value)),
              validator: (_) =>
                  context.read<SignInFormBloc>().state.password.value.fold(
                        (f) => f.maybeMap(
                          shortPassword: (_) => 'Short Password',
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<SignInFormBloc>()
                          .add(const SignInFormEvent.signInWithEmail());
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<SignInFormBloc>()
                          .add(const SignInFormEvent.signUpWithEmail());
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<SignInFormBloc>()
                    .add(const SignInFormEvent.signInWithGoogle());
              },
              child: const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
