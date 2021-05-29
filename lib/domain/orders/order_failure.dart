import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_failure.freezed.dart';

@freezed
class OrderFailure with _$OrderFailure {
  const factory OrderFailure.unexpected() = _Unexpected;
}
