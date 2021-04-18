import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/core/failures.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderStatus implements _$OrderStatus {
  const factory OrderStatus.draft() = _Draft;

  const factory OrderStatus.pending() = _Pending;

  const factory OrderStatus.success() = _Success;

  const factory OrderStatus.failure() = _Failure;

  const OrderStatus._();

  factory OrderStatus.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusFromJson(json);

  factory OrderStatus.fromJsonString(String stringOrderStatus) =>
      OrderStatus.fromJson({
        'runtimeType': stringOrderStatus,
      });

  String toJsonString() => toJson()['runtimeType'] as String;
}

@freezed
abstract class Order implements _$Order {
  const factory Order({
    @required UniqueId id,
    @required OrderStatus status,
    @required IVector<Deposit> deposits,
    String referenceId,
  }) = _Order;

  const Order._();

  factory Order.empty() => Order(
        id: UniqueId(),
        status: const OrderStatus.draft(),
        deposits: IVector.emptyVector(),
      );

  Either<ValueFailure<dynamic>, double> get totalAmount => deposits.foldRight(
        right(0.0),
        (deposit, accumulator) => Either.map2(
          deposit.amount,
          accumulator,
          (double d, double a) => d + a,
        ),
      );

  int get length => deposits.length();

  Option<ValueFailure<dynamic>> get failureOption {
    return none();
  }
}
