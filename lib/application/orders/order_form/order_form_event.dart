part of 'order_form_bloc.dart';

@freezed
class OrderFormEvent with _$OrderFormEvent {
  const factory OrderFormEvent.initialize(Option<Order> optionOrder) =
      _EditingOrder;

  const factory OrderFormEvent.addDeposit(Deposit deposit) = _AddDeposit;

  const factory OrderFormEvent.updateDeposit(Deposit deposit) = _UpdateDeposit;

  const factory OrderFormEvent.removeDeposit(Deposit deposit) = _RemoveDeposit;

  const factory OrderFormEvent.orderPlaced() = _OrderPlaced;

  const factory OrderFormEvent.orderDeleted() = _OrderDeleted;
}
