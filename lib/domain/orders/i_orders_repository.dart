import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/domain/orders/order_failure.dart';

abstract class IOrdersRepository {
  Future<Either<OrderFailure, Unit>> create(
    Order order,
  );

  Future<Either<OrderFailure, Unit>> update(
    Order order,
  );

  Future<Either<OrderFailure, Unit>> createOrUpdate(
    Order order,
  );

  Future<Either<OrderFailure, Unit>> delete(
    Order order,
  );

  Stream<Either<OrderFailure, IVector<Order>>> watchAll();
}
