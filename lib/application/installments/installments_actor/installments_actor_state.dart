part of 'installments_actor_bloc.dart';

@freezed
abstract class InstallmentsActorState with _$InstallmentsActorState {
  const factory InstallmentsActorState.initial() = _Initial;

  const factory InstallmentsActorState.inProgress() = _InProgress;

  const factory InstallmentsActorState.deleteSuccess() = _DeleteSuccess;

  const factory InstallmentsActorState.deleteFailure(
      InstallmentFailure failure) = _DeleteFailure;
}
