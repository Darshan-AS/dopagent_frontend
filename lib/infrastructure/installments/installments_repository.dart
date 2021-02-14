import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/infrastructure/installments/installment_storage.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IInstallmentRepository)
class InstallmentsRepository implements IInstallmentRepository {
  InstallmentsRepository() {
    Hive.registerAdapter(InstallmentStorageAdapter());
  }

  @override
  Future<Either<InstallmentFailure, Unit>> addInstallmentToList(
    InstallmentItem installmentItem,
  ) async {
    final installmentsListBox = await Hive.openBox('installments_list');
    await installmentsListBox.put(
      installmentItem.accountNumber.getOrThrow(),
      InstallmentStorage.fromDomain(installmentItem),
    );
    return right(unit);
  }

  @override
  Future<Either<InstallmentFailure, Unit>> updateInstallmentToList(
    InstallmentItem installmentItem,
  ) async {
    final installmentsListBox = await Hive.openBox('installments_list');
    await installmentsListBox.put(
      installmentItem.accountNumber.getOrThrow(),
      InstallmentStorage.fromDomain(installmentItem),
    );
    return right(unit);
  }

  @override
  Stream<Either<InstallmentFailure, IList<InstallmentItem>>>
      watchInstallmentsList() async* {
    final installmentsListBox = await Hive.openBox('installments_list');

    try {
      yield right(IList.from(installmentsListBox.values
          .cast<InstallmentStorage>()
          .map((installment) => installment.toDomain())));
    } catch (_) {
      yield left(const InstallmentFailure.unexpected());
    }

    yield* installmentsListBox.watch().map((_) {
      try {
        return right(IList.from(installmentsListBox.values
            .cast<InstallmentStorage>()
            .map((installment) => installment.toDomain())));
      } catch (_) {
        return left(const InstallmentFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<InstallmentFailure, String>> submitInstallmentsList(
      IList<InstallmentItem> installments) async {
    // TODO: implement submitInstallmentsList
    throw UnimplementedError();
  }
}
