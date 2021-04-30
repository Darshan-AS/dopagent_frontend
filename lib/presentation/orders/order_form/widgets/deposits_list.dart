import 'package:dopagent_frontend/application/orders/order_form/order_form_bloc.dart';
import 'package:dopagent_frontend/presentation/orders/order_form/widgets/deposit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositsList extends StatelessWidget {
  const DepositsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderFormBloc, OrderFormState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(state.order.id.getOrThrow()),
            ListView.builder(
              shrinkWrap: true, // TODO: Access performance impact
              itemBuilder: (context, index) => state.order.deposits
                  .get(index)
                  .fold(
                    () => Container(color: Colors.red, width: 200, height: 100),
                    (deposit) => DepositCard(deposit: deposit),
                  ),
              itemCount: state.order.length,
            ),
            // DepositsListBody(),
          ],
        );
      },
    );
  }
}
