part of 'installments_list_bloc.dart';

@freezed
abstract class InstallmentsListEvent with _$InstallmentsListEvent {
  const factory InstallmentsListEvent.fetchedInstallmentsList() =
      _FetchedInstallmentsList;

  const factory InstallmentsListEvent.deletedInstallment(
    InstallmentItem installmentItem,
  ) = _DeletedInstallment;

  const factory InstallmentsListEvent.submittedInstallmentsList() =
      _SubmittedInstallmentsList;
}
