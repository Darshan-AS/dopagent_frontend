import 'package:dopagent_frontend/application/installments/installment_form/installment_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NoOfInstallmentsField extends HookWidget {
  const NoOfInstallmentsField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<InstallmentFormBloc, InstallmentFormState>(
      listenWhen: (prevState, currState) =>
          prevState.isEditing != currState.isEditing,
      listener: (context, state) {
        textEditingController.text =
            state.installmentItem.noOfInstallments.getOrThrow().toString();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'No. of Installments',
          ),
          onChanged: (noOfInstallments) => context
              .read<InstallmentFormBloc>()
              .add(InstallmentFormEvent.noOfInstallmentsChanged(
                  int.parse(noOfInstallments))),
          validator: (_) => context
              .read<InstallmentFormBloc>()
              .state
              .installmentItem
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
