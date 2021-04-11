import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/deposits/deposits_actor/deposits_actor_bloc.dart';
import 'package:dopagent_frontend/application/orders/order_form/order_form_bloc.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DepositCard extends StatelessWidget {
  final Deposit deposit;

  const DepositCard({
    Key key,
    @required this.deposit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: const SlidableDrawerActionPane(),
        actionExtentRatio: 0.15,
        secondaryActions: [
          IconSlideAction(
            caption: 'Delete',
            icon: Icons.delete,
            color: Colors.red,
            onTap: () => context
                .read<DepositsActorBloc>()
                .add(DepositsActorEvent.deleted(deposit)),
          ),
        ],
        child: ListTile(
          title: Text(deposit.accountNumber.getOrThrow()),
          trailing: Text(deposit.noOfInstallments.getOrThrow().toString()),
          onTap: () => ExtendedNavigator.of(context).pushDepositFormPage(
            deposit: deposit,
            onDepositSaved: (Deposit deposit) => context
                .read<OrderFormBloc>()
                .add(OrderFormEvent.updateDeposit(deposit)),
            onDepositDeleted: (Deposit deposit) => context
                .read<OrderFormBloc>()
                .add(OrderFormEvent.removeDeposit(deposit)),
          ),
        ),
      );
}
