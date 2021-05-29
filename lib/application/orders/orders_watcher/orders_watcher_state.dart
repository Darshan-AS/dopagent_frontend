part of 'orders_watcher_bloc.dart';

@freezed
class OrdersWatcherState with _$OrdersWatcherState {
  const factory OrdersWatcherState.initial() = _Initial;

  const factory OrdersWatcherState.loading() = _Loading;

  const factory OrdersWatcherState.loadSuccess(IVector<Order> orders) =
      _LoadSuccess;

  const factory OrdersWatcherState.loadFailure(OrderFailure failure) =
      _LoadFailure;
}
