part of 'order_form_bloc.dart';


@freezed
abstract class OrderFormState with _$OrderFormState {
  const factory OrderFormState({
    @required Order order,
    @required bool isOrderPlacing,
  }) = _OrderFormState;

  factory OrderFormState.initial() => OrderFormState(
        order: Order.empty(),
        isOrderPlacing: false,
      );
}
