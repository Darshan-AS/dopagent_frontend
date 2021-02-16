part of 'installments_actor_bloc.dart';

@freezed
abstract class InstallmentsActorEvent with _$InstallmentsActorEvent {
  const factory InstallmentsActorEvent.deleted(InstallmentItem installment) =
      _Deleted;
}
