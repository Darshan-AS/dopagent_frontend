import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/deposit_failure.dart';
import 'package:dopagent_frontend/domain/deposits/i_deposit_repository.dart';
import 'package:dopagent_frontend/infrastructure/deposits/deposit_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDepositsRepository)
class DepositsRepository implements IDepositsRepository {
  DepositsRepository() {
    Hive.registerAdapter(DepositStorageAdapter());
  }

  @override
  Future<Either<DepositFailure, Unit>> add(
    Deposit deposit,
  ) async {
    final depositsListBox = await Hive.openBox('deposits_list');
    await depositsListBox.put(
      deposit.id.getOrThrow(),
      DepositStorage.fromDomain(deposit),
    );
    return right(unit);
  }

  @override
  Future<Either<DepositFailure, Unit>> update(
    Deposit deposit,
  ) async {
    final depositsListBox = await Hive.openBox('deposits_list');
    await depositsListBox.put(
      deposit.id.getOrThrow(),
      DepositStorage.fromDomain(deposit),
    );
    return right(unit);
  }

  @override
  Future<Either<DepositFailure, Unit>> delete(
    Deposit deposit,
  ) async {
    final depositsListBox = await Hive.openBox('deposits_list');
    await depositsListBox.delete(deposit.id.getOrThrow());
    return right(unit);
  }

  @override
  Stream<Either<DepositFailure, IVector<Deposit>>> watchAll() async* {
    final depositsListBox = await Hive.openBox('deposits_list');
    try {
      yield right(IVector.from(depositsListBox.values
          .cast<DepositStorage>()
          .map((deposit) => deposit.toDomain())));
    } catch (_) {
      yield left(const DepositFailure.unexpected());
    }

    yield* depositsListBox.watch().map((_) {
      try {
        return right(IVector.from(depositsListBox.values
            .cast<DepositStorage>()
            .map((deposit) => deposit.toDomain())));
      } catch (_) {
        return left(const DepositFailure.unexpected());
      }
    });
  }
}
