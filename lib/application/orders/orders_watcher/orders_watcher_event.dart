part of 'orders_watcher_bloc.dart';

@freezed
abstract class OrdersWatcherEvent with _$OrdersWatcherEvent {
  const factory OrdersWatcherEvent.watchAll() = _WatchAll;
}
