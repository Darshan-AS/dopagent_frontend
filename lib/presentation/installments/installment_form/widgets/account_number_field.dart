import 'package:dopagent_frontend/application/installments/installment_form/installment_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AccountNumberField extends HookWidget {
  const AccountNumberField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<InstallmentFormBloc, InstallmentFormState>(
      listenWhen: (prevState, currState) =>
          prevState.isEditing != currState.isEditing,
      listener: (context, state) {
        textEditingController.text =
            state.installmentItem.accountNumber.getOrThrow();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Account Number',
          ),
          onChanged: (accountNumber) => context
              .read<InstallmentFormBloc>()
              .add(InstallmentFormEvent.accountNumberChanged(accountNumber)),
          validator: (_) => context
              .read<InstallmentFormBloc>()
              .state
              .installmentItem
              .accountNumber
              .value
              .fold(
                (f) => f.maybeMap(
                  emptyValue: (_) => 'Cannot be empty',
                  invalidAccountNumber: (_) => 'Invalid Account Number',
                  orElse: () => null,
                ),
                (r) => null,
              ),
        ),
      ),
    );
  }
}
