import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/domain/deposits/deposit_failure.dart';

abstract class IDepositsRepository {
  Future<Either<DepositFailure, Unit>> add(
    Deposit deposit,
  );

  Future<Either<DepositFailure, Unit>> update(
    Deposit deposit,
  );

  Future<Either<DepositFailure, Unit>> delete(
    Deposit deposit,
  );

  Stream<Either<DepositFailure, IVector<Deposit>>> watchAll();
}
