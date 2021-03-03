import 'package:dartz/dartz.dart' hide Order;
import 'package:dopagent_frontend/domain/orders/i_orders_repository.dart';
import 'package:dopagent_frontend/domain/orders/order_failure.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IOrdersRepository)
class DepositsRepository implements IOrdersRepository {
  @override
  Future<Either<OrderFailure, Unit>> create(Order order) async {
    // TODO: implement create
    // throw UnimplementedError();
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> createOrUpdate(Order order) async {
    // TODO: implement createOrUpdate
    // throw UnimplementedError();
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> delete(Order order) async {
    // TODO: implement delete
    // throw UnimplementedError();
    return right(unit);
  }

  @override
  Future<Either<OrderFailure, Unit>> update(Order order) async {
    // TODO: implement update
    // throw UnimplementedError();
    return right(unit);
  }

  @override
  Stream<Either<OrderFailure, IVector<Order>>> watchAll() async* {
    // TODO: implement watchAll
    // throw UnimplementedError();
    yield right(IVector.emptyVector());
  }
}
