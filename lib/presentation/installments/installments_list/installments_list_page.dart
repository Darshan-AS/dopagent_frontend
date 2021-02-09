import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/auth/auth_bloc.dart';
import 'package:dopagent_frontend/application/installments/installment_form/installment_form_bloc.dart';
import 'package:dopagent_frontend/application/installments/installments_list/installments_list_bloc.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/installments/installments_list/widgets/installments_list_body.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentsListPage extends StatelessWidget {
  const InstallmentsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InstallmentsListBloc>(
          create: (context) => getIt<InstallmentsListBloc>()
            ..add(const InstallmentsListEvent.fetchedInstallmentsList()),
        ),
        BlocProvider<InstallmentFormBloc>(
          create: (context) => getIt<InstallmentFormBloc>(),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.signInPage),
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Installments'),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthEvent.signedOut()),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {},
              )
            ],
          ),
          body: InstallmentsListBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
