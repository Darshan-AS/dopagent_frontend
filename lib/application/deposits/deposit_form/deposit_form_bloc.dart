import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/deposit_failure.dart';
import 'package:dopagent_frontend/domain/deposits/i_deposit_repository.dart';
import 'package:dopagent_frontend/domain/deposits/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'deposit_form_bloc.freezed.dart';
part 'deposit_form_event.dart';
part 'deposit_form_state.dart';

class DepositFormBloc extends Bloc<DepositFormEvent, DepositFormState> {
  final void Function(Deposit) onDepositSaved;
  final void Function(Deposit) onDepositDeleted;

  DepositFormBloc({
    @required this.onDepositSaved,
    this.onDepositDeleted,
  }) : super(DepositFormState.initial());

  @override
  Stream<DepositFormState> mapEventToState(
    DepositFormEvent event,
  ) async* {
    yield* event.map(
      initialize: (e) async* {
        yield e.optionDeposit.fold(
          () => state,
          (deposit) => state.copyWith(
            deposit: deposit,
            isEditing: true,
          ),
        );
      },
      accountNumberChanged: (e) async* {
        yield state.copyWith(
          deposit: state.deposit.copyWith(
            accountNumber: AccountNumber(e.accountNumber),
          ),
          submitResponseOption: none(),
        );
      },
      noOfInstallmentsChanged: (e) async* {
        yield state.copyWith(
          deposit: state.deposit.copyWith(
            noOfInstallments: NoOfInstallments(
              int.tryParse(e.noOfInstallments) ?? 0,
            ),
          ),
          submitResponseOption: none(),
        );
      },
      saved: (e) async* {
        if (state.deposit.failureOption.isNone()) {
          yield state.copyWith(
            isSaving: true,
            submitResponseOption: none(),
          );

          onDepositSaved(state.deposit);

          yield state.copyWith(
            isSaving: false,
            submitResponseOption: some(right(unit)), // TODO: Rework this field
          );
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          submitResponseOption: none(),
        );
      },
      deleted: (e) async* {
        // TODO: Maybe add isDeleting instead of isSaving
        yield state.copyWith(
          isSaving: true,
          submitResponseOption: none(),
        );

        onDepositDeleted(state.deposit);

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: false,
          submitResponseOption: some(right(unit)),
        );
      },
    );
  }
}
