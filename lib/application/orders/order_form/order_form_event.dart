part of 'order_form_bloc.dart';

@freezed
abstract class OrderFormEvent with _$OrderFormEvent {
  const factory OrderFormEvent.initialize(Option<Order> optionOrder) =
      _EditingOrder;

  const factory OrderFormEvent.addDeposit(Deposit deposit) = _AddDeposit;

  const factory OrderFormEvent.updateDeposit(Deposit deposit) = _UpdateDeposit;

  const factory OrderFormEvent.removeDeposit(Deposit deposit) = _RemoveDeposit;

  const factory OrderFormEvent.orderPlaced() = _OrderPlaced;
}
