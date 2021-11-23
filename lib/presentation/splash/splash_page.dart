import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/auth/auth_bloc.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.when(
        initial: () => null,
        authenticated: () => ExtendedNavigator.of(context)
            .replace(Routes.depositsListPage),
        unauthenticated: () =>
            ExtendedNavigator.of(context).replace(Routes.signInPage),
      ),
      child: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
