import 'package:dopagent_frontend/application/installments/installments_list/installments_list_bloc.dart';
import 'package:dopagent_frontend/presentation/installments/installments_list/widgets/installment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentsListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstallmentsListBloc, InstallmentsListState>(
      builder: (context, state) => state.map(
        initial: (_) => Container(
          color: Colors.yellow,
          width: 200,
          height: 100,
        ),
        loadInProgress: (_) => const Center(child: CircularProgressIndicator()),
        loadSuccess: (state) {
          final installmentsList = state.installmentsList.toList();
          return ListView.builder(
            itemBuilder: (context, index) {
              final installment = installmentsList[index];
              return InstallmentCard(installment: installment);
            },
            itemCount: installmentsList.length,
          );
        },
        loadFailure: (_) => Container(
          color: Colors.red,
          width: 200,
          height: 100,
        ),
      ),
    );
  }
}
