import 'package:dopagent_frontend/application/installments/installments_watcher/installments_watcher_bloc.dart';
import 'package:dopagent_frontend/domain/installments/installment_item.dart';
import 'package:dopagent_frontend/presentation/installments/installments_list/widgets/installment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';

class InstallmentsListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InstallmentsWatcherBloc, InstallmentsWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) =>
              Container(color: Colors.yellow, width: 200, height: 100),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loadSuccess: (state) {
            final installmentsList = state.installments.toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                final installment = installmentsList[index];
                return InstallmentCard(installment: installment);
              },
              itemCount: installmentsList.length,
            );
            // return ImplicitlyAnimatedList<InstallmentItem>(
            //   areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            //   itemBuilder: (context, animation, item, index) {
            //     final installment = installmentsList[index];
            //     return InstallmentCard(installment: installment);
            //   },
            //   items: installmentsList,
            //   removeDuration: const Duration(),
            // );
          },
          loadFailure: (_) =>
              Container(color: Colors.red, width: 200, height: 100),
        );
      },
    );
  }
}
