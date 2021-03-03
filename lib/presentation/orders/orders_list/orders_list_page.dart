import 'package:auto_route/auto_route.dart';
import 'package:dopagent_frontend/application/orders/order_form/order_form_bloc.dart';
import 'package:dopagent_frontend/injection.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            ExtendedNavigator.of(context).pushOrderFormPage(order: null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
