part of 'orders_watcher_bloc.dart';

@freezed
class OrdersWatcherEvent with _$OrdersWatcherEvent {
  const factory OrdersWatcherEvent.watchAll() = _WatchAll;
}
