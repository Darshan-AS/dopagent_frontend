part of 'deposits_watcher_bloc.dart';

@freezed
abstract class DepositsWatcherEvent with _$DepositsWatcherEvent {
  const factory DepositsWatcherEvent.watchAll() = _WatchAll;
}
