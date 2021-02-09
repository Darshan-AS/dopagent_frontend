import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:flutter/material.dart';

class InstallmentCard extends StatelessWidget {
  final InstallmentItem installment;

  const InstallmentCard({
    Key key,
    @required this.installment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(installment.accountNumber.getOrThrow()),
        trailing: Text(installment.noOfInstallments.getOrThrow().toString()),
      );
}
