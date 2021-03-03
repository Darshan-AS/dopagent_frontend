part of 'deposits_watcher_bloc.dart';

@freezed
abstract class DepositsWatcherState with _$DepositsWatcherState {
  const factory DepositsWatcherState.initial() = _Initial;

  const factory DepositsWatcherState.loading() = _Loading;

  const factory DepositsWatcherState.loadSuccess(
    IVector<Deposit> deposits,
  ) = _LoadSuccess;

  const factory DepositsWatcherState.loadFailure(
    DepositFailure failure,
  ) = _LoadFailure;
}
