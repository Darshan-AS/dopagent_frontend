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
          loadSuccess: (state) => ListView.builder(
            itemBuilder: (context, index) => state.deposits.get(index).fold(
                  () => Container(color: Colors.red, width: 200, height: 100),
                  (deposit) => DepositCard(deposit: deposit),
                ),
            itemCount: state.deposits.length(),
          ),
          loadFailure: (_) =>
              Container(color: Colors.red, width: 200, height: 100),
        );
      },
    );
  }
}
