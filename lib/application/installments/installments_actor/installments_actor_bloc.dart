import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'installments_actor_bloc.freezed.dart';
part 'installments_actor_event.dart';
part 'installments_actor_state.dart';

@injectable
class InstallmentsActorBloc
    extends Bloc<InstallmentsActorEvent, InstallmentsActorState> {
  final IInstallmentRepository _installmentRepository;

  InstallmentsActorBloc(this._installmentRepository)
      : super(const InstallmentsActorState.initial());

  @override
  Stream<InstallmentsActorState> mapEventToState(
    InstallmentsActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {
        yield const InstallmentsActorState.inProgress();

        final deleteResponse = await _installmentRepository
            .deleteInstallmentFromList(e.installment);

        yield deleteResponse.fold(
          (f) => InstallmentsActorState.deleteFailure(f),
          (r) => const InstallmentsActorState.deleteSuccess(),
        );
      },
    );
  }
}
