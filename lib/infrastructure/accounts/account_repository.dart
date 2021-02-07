import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/account.dart';
import 'package:dopagent_frontend/domain/accounts/account_failure.dart';
import 'package:dopagent_frontend/domain/accounts/i_account_repository.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/infrastructure/accounts/datasources/account_local_datasource.dart';
import 'package:dopagent_frontend/infrastructure/accounts/datasources/account_remote_datasource.dart';
import 'package:dopagent_frontend/infrastructure/core/network_info.dart';

class AccountRepository implements IAccountRepository {
  final IAccountRemouteDataSource remoteSource;
  final IAccountLocalDataSource localSource;
  final INetworkInfo networkInfo;

  AccountRepository(this.remoteSource, this.localSource, this.networkInfo);

  @override
  Future<Either<AccountFailure, IList<Account>>> getAllAccounts() async {
    if (await networkInfo.isConnected) {
      try {
        final accounts = await remoteSource.getAllAccounts();
        return right(accounts.map((a) => a.toDomain()));
      } catch (e) {
        return left(const AccountFailure.unexpected());
      }
    } else {
      return left(const AccountFailure.unexpected());
    }
  }

  @override
  Future<Either<AccountFailure, IList<Account>>> getAccounts(
    IList<AccountNumber> accountNumbers,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final accounts = await remoteSource.getAccounts(accountNumbers);
        return right(accounts.map((a) => a.toDomain()));
      } catch (e) {
        return left(const AccountFailure.unexpected());
      }
    } else {
      return left(const AccountFailure.unexpected());
    }
  }

  @override
  Future<Either<AccountFailure, Account>> getAccount(
    AccountNumber accountNumber,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final account = await remoteSource.getAccount(accountNumber);
        return right(account.toDomain());
      } catch (e) {
        return left(const AccountFailure.unexpected());
      }
    } else {
      return left(const AccountFailure.unexpected());
    }
  }

  @override
  Future<Either<AccountFailure, Account>> syncAccount(
      Account currentAccount) async {
    if (await networkInfo.isConnected) {
      try {
        final account = await remoteSource.syncAccount(currentAccount);
        return right(account.toDomain());
      } catch (e) {
        return left(const AccountFailure.unexpected());
      }
    } else {
      return left(const AccountFailure.unexpected());
    }
  }
}
