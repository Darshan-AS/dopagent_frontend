import 'package:dopagent_frontend/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),
      ),
    );
}
