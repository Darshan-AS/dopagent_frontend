import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/application/orders/order_form/order_form_bloc.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/deposits/deposits_list/widgets/deposit_card.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
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
      create: (context) => getIt<OrderFormBloc>()
        ..add(OrderFormEvent.initialize(optionOf(order))),
      child: BlocListener<OrderFormBloc, OrderFormState>(
        listenWhen: (prevState, currState) =>
            prevState.submitResponseOption != currState.submitResponseOption,
        listener: (context, state) => state.submitResponseOption.fold(
          () {},
          (either) => either.fold(
            (failure) => FlushbarHelper.createError(
              message: failure.map(
                unexpected: (_) => 'Unexpected Error',
              ),
            ).show(context),
            (_) {
              ExtendedNavigator.of(context).popUntil(
                (route) => route.settings.name == Routes.ordersListPage,
              );
            },
          ),
        ),
        child: const OrderFormPageScaffold(),
      ),
    );
  }
}

class OrderFormPageScaffold extends StatelessWidget {
  const OrderFormPageScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<OrderFormBloc, OrderFormState>(
          buildWhen: (prevState, currState) =>
              prevState.isEditing != currState.isEditing,
          builder: (context, state) => Text(
            state.isEditing ? 'Edit Order' : 'Add Order',
          ),
        ),
        actions: [
          BlocBuilder<OrderFormBloc, OrderFormState>(
            buildWhen: (prevState, currState) =>
                prevState.isEditing != currState.isEditing,
            builder: (context, state) => state.isEditing
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => context
                        .read<OrderFormBloc>()
                        .add(const OrderFormEvent.orderDeleted()),
                  )
                : Container(),
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => context
                .read<OrderFormBloc>()
                .add(const OrderFormEvent.orderPlaced()),
          ),
        ],
      ),
      body: BlocBuilder<OrderFormBloc, OrderFormState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.order.id.getOrThrow()),
              ListView.builder(
                shrinkWrap: true, // TODO: Access performance impact
                itemBuilder: (context, index) => state.order.deposits
                    .get(index)
                    .fold(
                      () =>
                          Container(color: Colors.red, width: 200, height: 100),
                      (deposit) => DepositCard(deposit: deposit),
                    ),
                itemCount: state.order.length,
              ),
              // DepositsListBody(),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ExtendedNavigator.of(context).pushDepositFormPage(
          deposit: null,
          onDepositSaved: (Deposit deposit) => context
              .read<OrderFormBloc>()
              .add(OrderFormEvent.addDeposit(deposit)),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
