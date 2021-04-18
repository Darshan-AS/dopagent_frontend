import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/domain/orders/i_orders_repository.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/domain/orders/order_failure.dart';
import 'package:dopagent_frontend/infrastructure/deposits/deposit_storage.dart';
import 'package:dopagent_frontend/infrastructure/orders/order_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOrdersRepository)
class OrdersRepository implements IOrdersRepository {
  OrdersRepository() {
    Hive.registerAdapter(OrderStorageAdapter());
    Hive.registerAdapter(DepositStorageAdapter());
  }
  @override
  Future<Either<OrderFailure, Unit>> create(Order order) async {
    final ordersListBox = await Hive.openBox('orders_list');
    await ordersListBox.put(
      order.id.getOrThrow(),
      OrderStorage.fromDomain(order),
    );
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> createOrUpdate(Order order) async {
    final ordersListBox = await Hive.openBox('orders_list');
    await ordersListBox.put(
      order.id.getOrThrow(),
      OrderStorage.fromDomain(order),
    );
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> update(Order order) async {
    final ordersListBox = await Hive.openBox('orders_list');
    await ordersListBox.put(
      order.id.getOrThrow(),
      OrderStorage.fromDomain(order),
    );
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> delete(Order order) async {
    final ordersListBox = await Hive.openBox('orders_list');
    await ordersListBox.delete(order.id.getOrThrow());
    return right(unit);
  }

  @override
  Stream<Either<OrderFailure, IVector<Order>>> watchAll() async* {
    final ordersListBox = await Hive.openBox('orders_list');
    try {
      yield right(IVector.from(ordersListBox.values
          .cast<OrderStorage>()
          .map((order) => order.toDomain())));
    } catch (_) {
      yield left(const OrderFailure.unexpected());
    }

    yield* ordersListBox.watch().map((_) {
      try {
        return right(IVector.from(ordersListBox.values
            .cast<OrderStorage>()
            .map((order) => order.toDomain())));
      } catch (_) {
        return left(const OrderFailure.unexpected());
      }
    });
  }
}
