import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'installments_list_bloc.freezed.dart';
part 'installments_list_event.dart';
part 'installments_list_state.dart';

@injectable
class InstallmentsListBloc
    extends Bloc<InstallmentsListEvent, InstallmentsListState> {
  final IInstallmentRepository _installmentRepository;

  InstallmentsListBloc(this._installmentRepository)
      : super(const InstallmentsListState.initial());

  @override
  Stream<InstallmentsListState> mapEventToState(
    InstallmentsListEvent event,
  ) async* {
    yield* event.map(
      fetchedInstallmentsList: (_) async* {},
      // TODO: Implement this
      deletedInstallment: (_) async* {},
      submittedInstallmentsList: (_) async* {},
    );
  }
}
