part of 'installments_watcher_bloc.dart';

@freezed
abstract class InstallmentsWatcherState with _$InstallmentsWatcherState {
  const factory InstallmentsWatcherState.initial() = _Initial;

  const factory InstallmentsWatcherState.loading() = _Loading;

  const factory InstallmentsWatcherState.loadSuccess(
    IList<InstallmentItem> installments,
  ) = _LoadSuccess;

  const factory InstallmentsWatcherState.loadFailure(
    InstallmentFailure failure,
  ) = _LoadFailure;
}
