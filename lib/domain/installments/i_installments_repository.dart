import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/accounts/value_objects.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/domain/installments/value_objects.dart';

abstract class IInstallmentRepository {
  Future<Either<InstallmentFailure, Unit>> saveInstallmentItem(
    InstallmentItem installmentItem,
  );

  Future<Either<InstallmentFailure, String>> submitInstallments(
      IList<InstallmentItem> installments);
}
