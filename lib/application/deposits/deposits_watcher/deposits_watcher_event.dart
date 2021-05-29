part of 'deposits_watcher_bloc.dart';

@freezed
class DepositsWatcherEvent with _$DepositsWatcherEvent {
  const factory DepositsWatcherEvent.watchAll() = _WatchAll;
}
