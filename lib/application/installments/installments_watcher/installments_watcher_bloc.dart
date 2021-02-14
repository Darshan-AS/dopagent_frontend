import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'installments_watcher_event.dart';
part 'installments_watcher_state.dart';
part 'installments_watcher_bloc.freezed.dart';

@injectable
class InstallmentsWatcherBloc
    extends Bloc<InstallmentsWatcherEvent, InstallmentsWatcherState> {
  final IInstallmentRepository _installmentRepository;

  InstallmentsWatcherBloc(this._installmentRepository)
      : super(const InstallmentsWatcherState.initial());

  @override
  Stream<InstallmentsWatcherState> mapEventToState(
    InstallmentsWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield const InstallmentsWatcherState.loading();
        yield* _installmentRepository.watchInstallmentsList().map(
              (eitherInstallments) => eitherInstallments.fold(
                (f) => InstallmentsWatcherState.loadFailure(f),
                (installments) =>
                    InstallmentsWatcherState.loadSuccess(installments),
              ),
            );
      },
    );
  }
}
