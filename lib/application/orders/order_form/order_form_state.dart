part of 'order_form_bloc.dart';

@freezed
abstract class OrderFormState with _$OrderFormState {
  const factory OrderFormState({
    @required Order order,
    @required bool isEditing,
    @required bool isOrderPlacing,
    @required Option<Either<OrderFailure, Unit>> submitResponseOption,
  }) = _OrderFormState;

  factory OrderFormState.initial() => OrderFormState(
        order: Order.empty(),
        isEditing: false,
        isOrderPlacing: false,
        submitResponseOption: none(),
      );
}
