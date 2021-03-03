import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/i_orders_repository.dart';
import 'package:dopagent_frontend/domain/deposits/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'order_form_event.dart';
part 'order_form_state.dart';
part 'order_form_bloc.freezed.dart';

@injectable
class OrderFormBloc extends Bloc<OrderFormEvent, OrderFormState> {
  final IOrdersRepository _ordersRepository;

  OrderFormBloc(this._ordersRepository) : super(OrderFormState.initial());

  @override
  Stream<OrderFormState> mapEventToState(
    OrderFormEvent event,
  ) async* {
    yield* event.map(
      initialize: (e) async* {
        yield e.optionOrder.fold(
          () => state,
          (order) => state.copyWith(order: order),
        );
      },
      addDeposit: (e) async* {
        final order = state.order.copyWith(
          deposits: state.order.deposits.appendElement(e.deposit),
        );
        final response = await _ordersRepository
            .createOrUpdate(order); // TODO: Do something with the result
        yield state.copyWith(order: order);
      },
      updateDeposit: (e) async* {
        final order = state.order.copyWith(
          deposits: state.order.deposits.map(
            (deposit) => deposit.id == e.deposit.id ? e.deposit : deposit,
          ),
        );
        final response = await _ordersRepository
            .update(order); // TODO: Do something with the result
        yield state.copyWith(order: order);
      },
      removeDeposit: (e) async* {
        final order = state.order.copyWith(
          deposits: state.order.deposits.filter(
            (deposit) => deposit.id != e.deposit.id,
          ),
        );
        final response = await _ordersRepository
            .delete(order); // TODO: Do something with the result
        yield state.copyWith(order: order);
      },
      orderPlaced: (e) async* {
        // TODO: Implement this
      },
    );
  }
}
