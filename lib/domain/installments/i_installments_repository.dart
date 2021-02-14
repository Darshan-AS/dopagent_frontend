import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';

abstract class IInstallmentRepository {
  Future<Either<InstallmentFailure, Unit>> addInstallmentToList(
    InstallmentItem installmentItem,
  );

  Future<Either<InstallmentFailure, Unit>> updateInstallmentToList(
    InstallmentItem installmentItem,
  );

  Stream<Either<InstallmentFailure, IList<InstallmentItem>>> watchInstallmentsList();

  Future<Either<InstallmentFailure, String>> submitInstallmentsList(
      IList<InstallmentItem> installments);
}
