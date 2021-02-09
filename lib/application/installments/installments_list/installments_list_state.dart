part of 'installments_list_bloc.dart';

@freezed
abstract class InstallmentsListState with _$InstallmentsListState {
  const factory InstallmentsListState.initial() = _Initial;

  const factory InstallmentsListState.loadInProgress() = _LoadInProgress;

  const factory InstallmentsListState.loadSuccess(
    IList<InstallmentItem> installmentsList,
  ) = _LoadSuccess;

  const factory InstallmentsListState.loadFailure(
    InstallmentFailure installmentFailure,
  ) = _LoadFailure;
}
