import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/installments/installments_actor/installments_actor_bloc.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class InstallmentCard extends StatelessWidget {
  final InstallmentItem installment;

  const InstallmentCard({
    Key key,
    @required this.installment,
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
                .read<InstallmentsActorBloc>()
                .add(InstallmentsActorEvent.deleted(installment)),
          ),
        ],
        child: ListTile(
          title: Text(installment.accountNumber.getOrThrow()),
          trailing: Text(installment.noOfInstallments.getOrThrow().toString()),
          onTap: () => ExtendedNavigator.of(context)
              .pushInstallmentFormPage(installment: installment),
        ),
      );
}
