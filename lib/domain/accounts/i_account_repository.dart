import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/account.dart';
import 'package:dopagent_frontend/domain/accounts/account_failure.dart';

abstract class IAccountRepository {
  Stream<Either<AccountFailure, IList<Account>>> watchAll();

  Future<Either<AccountFailure, Unit>> create(Account account);
  Future<Either<AccountFailure, Unit>> update(Account account);
  Future<Either<AccountFailure, Unit>> delete(Account account);
}
