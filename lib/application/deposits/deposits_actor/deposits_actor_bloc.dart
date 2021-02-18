import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/deposit_failure.dart';
import 'package:dopagent_frontend/domain/deposits/i_deposit_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'deposits_actor_bloc.freezed.dart';
part 'deposits_actor_event.dart';
part 'deposits_actor_state.dart';

@injectable
class DepositsActorBloc extends Bloc<DepositsActorEvent, DepositsActorState> {
  final IDepositsRepository _depositsRepository;

  DepositsActorBloc(this._depositsRepository)
      : super(const DepositsActorState.initial());

  @override
  Stream<DepositsActorState> mapEventToState(
    DepositsActorEvent event,
  ) async* {
    yield* event.map(
      deleted: (e) async* {
        yield const DepositsActorState.inProgress();

        final deleteResponse = await _depositsRepository
            .delete(e.deposit);

        yield deleteResponse.fold(
          (f) => DepositsActorState.deleteFailure(f),
          (r) => const DepositsActorState.deleteSuccess(),
        );
      },
    );
  }
}
