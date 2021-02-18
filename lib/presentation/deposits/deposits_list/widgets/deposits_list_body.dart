import 'package:dopagent_frontend/application/deposits/deposits_watcher/deposits_watcher_bloc.dart';
import 'package:dopagent_frontend/presentation/deposits/deposits_list/widgets/deposit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositsListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepositsWatcherBloc, DepositsWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) =>
              Container(color: Colors.yellow, width: 200, height: 100),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loadSuccess: (state) {
            final depositsList = state.deposits.toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                final deposit = depositsList[index];
                return DepositCard(deposit: deposit);
              },
              itemCount: depositsList.length,
            );
            // return ImplicitlyAnimatedList<Deposit>(
            //   areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            //   itemBuilder: (context, animation, item, index) {
            //     final deposit = deposits[index];
            //     return DepositCard(deposit: deposit);
            //   },
            //   items: deposits,
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
