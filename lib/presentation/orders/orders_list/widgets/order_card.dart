import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({
    Key key,
    @required this.order,
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
            onTap: () {},
          ),
        ],
        child: ListTile(
          title: Text(order.id.getOrThrow()),
          trailing: Text(order.status.toJsonString()),
          onTap: () =>
              ExtendedNavigator.of(context).pushOrderFormPage(order: order),
        ),
      );
}
