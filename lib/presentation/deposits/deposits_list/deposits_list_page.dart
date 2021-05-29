import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/auth/auth_bloc.dart';
import 'package:dopagent_frontend/application/deposits/deposit_form/deposit_form_bloc.dart';
import 'package:dopagent_frontend/application/deposits/deposits_actor/deposits_actor_bloc.dart';
import 'package:dopagent_frontend/application/deposits/deposits_watcher/deposits_watcher_bloc.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/deposits/deposits_list/widgets/deposits_list_body.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositsListPage extends StatelessWidget {
  const DepositsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DepositsWatcherBloc>(
          create: (context) => getIt<DepositsWatcherBloc>()
            ..add(const DepositsWatcherEvent.watchAll()),
        ),
        BlocProvider<DepositsActorBloc>(
          create: (context) => getIt<DepositsActorBloc>(),
        ),
        BlocProvider<DepositFormBloc>(
          create: (context) => getIt<DepositFormBloc>(),
        )
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) => context.replaceRoute(const SignInPageRoute()),
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Deposits'),
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
          body: DepositsListBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
