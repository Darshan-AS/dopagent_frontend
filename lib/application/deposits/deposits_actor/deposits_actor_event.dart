part of 'deposits_actor_bloc.dart';

@freezed
abstract class DepositsActorEvent with _$DepositsActorEvent {
  const factory DepositsActorEvent.deleted(Deposit deposit) = _Deleted;
}
