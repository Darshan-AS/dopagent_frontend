import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/deposit_failure.dart';
import 'package:dopagent_frontend/domain/deposits/i_deposit_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'deposits_watcher_bloc.freezed.dart';
part 'deposits_watcher_event.dart';
part 'deposits_watcher_state.dart';

@injectable
class DepositsWatcherBloc
    extends Bloc<DepositsWatcherEvent, DepositsWatcherState> {
  final IDepositsRepository _depositsRepository;

  DepositsWatcherBloc(this._depositsRepository)
      : super(const DepositsWatcherState.initial());

  @override
  Stream<DepositsWatcherState> mapEventToState(
    DepositsWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAll: (e) async* {
        yield const DepositsWatcherState.loading();
        yield* _depositsRepository.watchAll().map(
              (eitherDeposits) => eitherDeposits.fold(
                (f) => DepositsWatcherState.loadFailure(f),
                (deposits) =>
                    DepositsWatcherState.loadSuccess(deposits),
              ),
            );
      },
    );
  }
}
