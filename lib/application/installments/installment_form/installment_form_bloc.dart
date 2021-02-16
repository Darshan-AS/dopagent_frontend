import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/domain/installments/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'installment_form_bloc.freezed.dart';
part 'installment_form_event.dart';
part 'installment_form_state.dart';

@injectable
class InstallmentFormBloc
    extends Bloc<InstallmentFormEvent, InstallmentFormState> {
  final IInstallmentRepository _installmentRepository;

  InstallmentFormBloc(this._installmentRepository)
      : super(InstallmentFormState.initial());

  @override
  Stream<InstallmentFormState> mapEventToState(
    InstallmentFormEvent event,
  ) async* {
    yield* event.map(
      initialize: (e) async* {
        yield e.optionInstallment.fold(
          () => state,
          (installment) => state.copyWith(
            installmentItem: installment,
            isEditing: true,
          ),
        );
      },
      accountNumberChanged: (e) async* {
        yield state.copyWith(
          installmentItem: state.installmentItem.copyWith(
            accountNumber: AccountNumber(e.accountNumber),
          ),
          submitResponseOption: none(),
        );
      },
      noOfInstallmentsChanged: (e) async* {
        yield state.copyWith(
          installmentItem: state.installmentItem.copyWith(
            noOfInstallments: NoOfInstallments(
              int.tryParse(e.noOfInstallments) ?? 0,
            ),
          ),
          submitResponseOption: none(),
        );
      },
      saved: (e) async* {
        Either<InstallmentFailure, Unit> saveResponse;

        if (state.installmentItem.failureOption.isNone()) {
          yield state.copyWith(
            isSaving: true,
            submitResponseOption: none(),
          );

          saveResponse = state.isEditing
              ? await _installmentRepository
                  .updateInstallmentToList(state.installmentItem)
              : await _installmentRepository
                  .addInstallmentToList(state.installmentItem);
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          submitResponseOption: optionOf(saveResponse),
        );
      },
      deleted: (e) async* {
        Either<InstallmentFailure, Unit> deleteResponse;

        // TODO: Maybe add isDeleting instead of isSaving
        yield state.copyWith(
          isSaving: true,
          submitResponseOption: none(),
        );

        deleteResponse = state.isEditing
            ? await _installmentRepository
                .deleteInstallmentFromList(state.installmentItem)
            : right(unit);

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: false,
          submitResponseOption: optionOf(deleteResponse),
        );
      },
    );
  }
}
