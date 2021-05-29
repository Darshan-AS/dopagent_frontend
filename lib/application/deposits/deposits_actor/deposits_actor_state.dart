part of 'deposits_actor_bloc.dart';

@freezed
class DepositsActorState with _$DepositsActorState {
  const factory DepositsActorState.initial() = _Initial;

  const factory DepositsActorState.inProgress() = _InProgress;

  const factory DepositsActorState.deleteSuccess() = _DeleteSuccess;

  const factory DepositsActorState.deleteFailure(DepositFailure failure) =
      _DeleteFailure;
}
