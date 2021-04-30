import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/auth/auth_bloc.dart';
import 'package:dopagent_frontend/application/orders/orders_watcher/orders_watcher_bloc.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/orders/orders_list/widgets/orders_list_body.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersWatcherBloc>(
            create: (context) => getIt<OrdersWatcherBloc>()
              ..add(const OrdersWatcherEvent.watchAll()))
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            unauthenticated: (_) =>
                ExtendedNavigator.of(context).replace(Routes.signInPage),
            orElse: () {},
          );
        },
        child: const OrdersListScaffold(),
      ),
    );
  }
}

class OrdersListScaffold extends StatelessWidget {
  const OrdersListScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
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
      body: OrdersListBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ExtendedNavigator.of(context).pushOrderFormPage(order: null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
