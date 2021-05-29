import 'package:dopagent_frontend/application/deposits/deposit_form/deposit_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoOfInstallmentsField extends HookWidget {
  const NoOfInstallmentsField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<DepositFormBloc, DepositFormState>(
      listenWhen: (prevState, currState) =>
          prevState.isEditing != currState.isEditing,
      listener: (context, state) {
        textEditingController.text =
            state.deposit.noOfInstallments.getOrThrow().toString();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'No. of Installments',
          ),
          keyboardType: TextInputType.number,
          // initialValue: '1',
          autocorrect: false,
          onChanged: (noOfInstallments) => context
              .read<DepositFormBloc>()
              .add(DepositFormEvent.noOfInstallmentsChanged(noOfInstallments)),
          validator: (_) => context
              .read<DepositFormBloc>()
              .state
              .deposit
              .noOfInstallments
              .value
              .fold(
                (f) => f.maybeMap(
                  emptyValue: (_) => 'Cannot be empty',
                  invalidValue: (_) => 'Invalid value',
                  orElse: () => null,
                ),
                (r) => null,
              ),
        ),
      ),
    );
  }
}
