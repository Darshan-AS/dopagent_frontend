import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/account.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/infrastructure/accounts/account_storage.dart';

abstract class IAccountRemouteDataSource {
  Future<IList<AccountStorage>> getAllAccounts();
  Future<IList<AccountStorage>> getAccounts(
      IList<AccountNumber> accountNumbers);
  Future<AccountStorage> getAccount(AccountNumber accountNumber);
  Future<AccountStorage> syncAccount(Account account);
}
