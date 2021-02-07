import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/account.dart';
import 'package:dopagent_frontend/domain/accounts/account_failure.dart';
import 'package:dopagent_frontend/domain/core/value_objects.dart';

abstract class IAccountRepository {
  Future<Either<AccountFailure, IList<Account>>> getAllAccounts();
  Future<Either<AccountFailure, IList<Account>>> getAccounts(
    IList<AccountNumber> accountNumbers,
  );
  Future<Either<AccountFailure, Account>> getAccount(
    AccountNumber accountNumber,
  );
  Future<Either<AccountFailure, Account>> syncAccount(Account account);
}
