part of 'installments_watcher_bloc.dart';

@freezed
abstract class InstallmentsWatcherEvent with _$InstallmentsWatcherEvent {
  const factory InstallmentsWatcherEvent.watchAll() = _WatchAll;
}
