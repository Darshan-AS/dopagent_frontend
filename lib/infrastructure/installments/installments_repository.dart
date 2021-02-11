import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/domain/installments/i_installments_repository.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/domain/installments/installment_failure.dart';
import 'package:dopagent_frontend/infrastructure/installments/installment_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IInstallmentRepository)
class InstallmentsRepository implements IInstallmentRepository {
  var tempList = [
    const InstallmentStorage(accountNumber: '123', noOfInstallments: 1),
    const InstallmentStorage(accountNumber: '456', noOfInstallments: 3),
    const InstallmentStorage(accountNumber: '789', noOfInstallments: 2),
  ];

  @override
  Future<Either<InstallmentFailure, Unit>> addInstallmentToList(
    InstallmentItem installmentItem,
  ) async {
    tempList.add(InstallmentStorage.fromDomain(installmentItem));
    print('Inside addInstallmentToList');
    return right(unit);
  }

  @override
  Future<Either<InstallmentFailure, IList<InstallmentItem>>>
      getInstallmentsList() async {
    print('Inside getInstallmentsList');

    return right<InstallmentFailure, IList<InstallmentItem>>(
      IList.from(
        tempList.map((installment) => installment.toDomain()),
      ),
    );
  }

  @override
  Future<Either<InstallmentFailure, String>> submitInstallmentsList(
      IList<InstallmentItem> installments) async {
    // TODO: implement submitInstallmentsList
    throw UnimplementedError();
  }
}
