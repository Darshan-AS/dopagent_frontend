import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/domain/orders/i_orders_repository.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/domain/orders/order_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'orders_watcher_event.dart';
part 'orders_watcher_state.dart';
part 'orders_watcher_bloc.freezed.dart';

@injectable
class OrdersWatcherBloc extends Bloc<OrdersWatcherEvent, OrdersWatcherState> {
  final IOrdersRepository _ordersRepository;
  OrdersWatcherBloc(this._ordersRepository)
      : super(const OrdersWatcherState.initial());

  @override
  Stream<OrdersWatcherState> mapEventToState(
    OrdersWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield const OrdersWatcherState.loading();
        yield* _ordersRepository.watchAll().map(
              (eitherOrders) => eitherOrders.fold(
                (f) => OrdersWatcherState.loadFailure(f),
                (orders) => OrdersWatcherState.loadSuccess(orders),
              ),
            );
      },
    );
  }
}
