import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/orders/order_form/order_form_bloc.dart';
import 'package:dopagent_frontend/domain/deposits/order.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/deposits/deposits_list/widgets/deposit_card.dart';
import 'package:flutter/material.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderFormPage extends StatelessWidget {
  final Order order;
  const OrderFormPage({
    Key key,
    @required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderFormBloc>(),
      child: OrderFormPageScaffold(),
    );
  }
}

class OrderFormPageScaffold extends StatelessWidget {
  const OrderFormPageScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('order_123')),
      body: BlocBuilder<OrderFormBloc, OrderFormState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: [
                Text(state.order.id.getOrThrow()),
                ListView.builder(
                  shrinkWrap: true, // TODO: Access performance impact
                  itemBuilder: (context, index) =>
                      state.order.deposits.get(index).fold(
                            () => Container(
                                color: Colors.red, width: 200, height: 100),
                            (deposit) => DepositCard(deposit: deposit),
                          ),
                  itemCount: state.order.length,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ExtendedNavigator.of(context).pushDepositFormPage(
            deposit: null,
            orderFormBloc: context.read<OrderFormBloc>(),
          ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
