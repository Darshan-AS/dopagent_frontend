import 'package:dopagent_frontend/application/orders/orders_watcher/orders_watcher_bloc.dart';
import 'package:dopagent_frontend/presentation/orders/orders_list/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersWatcherBloc, OrdersWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) =>
              Container(color: Colors.yellow, width: 200, height: 100),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loadSuccess: (state) => ListView.builder(
            itemBuilder: (context, index) => state.orders.get(index).fold(
                  () => Container(color: Colors.red, width: 200, height: 100),
                  (order) => OrderCard(order: order),
                ),
            itemCount: state.orders.length(),
          ),
          loadFailure: (_) =>
              Container(color: Colors.red, width: 200, height: 100),
        );
      },
    );
  }
}
