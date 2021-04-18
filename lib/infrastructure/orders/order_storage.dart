import 'dart:convert';

import 'package:dartz/dartz.dart' hide id, Order;
import 'package:dopagent_frontend/domain/core/value_objects.dart';
import 'package:dopagent_frontend/domain/orders/order.dart';
import 'package:dopagent_frontend/infrastructure/deposits/deposit_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'order_storage.freezed.dart';
part 'order_storage.g.dart';

@freezed
abstract class OrderStorage implements _$OrderStorage {
  @HiveType(typeId: 2)
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderStorage({
    @JsonKey(ignore: true) @HiveField(0) String id,
    @required @HiveField(1) String status,
    @required @HiveField(2) List<DepositStorage> deposits,
  }) = _OrderStorage;

  const OrderStorage._();

  factory OrderStorage.fromDomain(Order order) {
    return OrderStorage(
      id: order.id.getOrThrow(),
      status: order.status.toJsonString(),
      deposits: order.deposits
          .toIterable()
          .map((deposit) => DepositStorage.fromDomain(deposit))
          .toList(),
    );
  }

  Order toDomain() {
    return Order(
      id: UniqueId.fromUniqueString(id),
      status: OrderStatus.fromJsonString(status),
      deposits: IVector.from(
          deposits.map((depositStorage) => depositStorage.toDomain())),
    );
  }

  factory OrderStorage.fromJson(Map<String, dynamic> json) =>
      _$OrderStorageFromJson(json);
}
