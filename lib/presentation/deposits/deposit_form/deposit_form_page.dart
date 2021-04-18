import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dopagent_frontend/application/deposits/deposit_form/deposit_form_bloc.dart';
import 'package:dopagent_frontend/domain/deposits/deposit.dart';
import 'package:dopagent_frontend/presentation/deposits/deposit_form/widgets/account_number_field.dart';
import 'package:dopagent_frontend/presentation/deposits/deposit_form/widgets/no_of_installments_field.dart';
import 'package:dopagent_frontend/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepositFormPage extends StatelessWidget {
  final Deposit deposit;
  final void Function(Deposit) onDepositSaved;
  final void Function(Deposit) onDepositDeleted;

  const DepositFormPage({
    Key key,
    @required this.deposit,
    @required this.onDepositSaved,
    this.onDepositDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DepositFormBloc(
          onDepositSaved: onDepositSaved,
          onDepositDeleted: onDepositDeleted,
        )..add(DepositFormEvent.initialize(optionOf(deposit))),
        child: BlocConsumer<DepositFormBloc, DepositFormState>(
          listenWhen: (prevState, currState) =>
              prevState.submitResponseOption != currState.submitResponseOption,
          listener: (context, state) => state.submitResponseOption.fold(
            () {},
            (either) => either.fold(
              (failure) => FlushbarHelper.createError(
                message: failure.map(
                  unexpected: (_) => 'Unexpected Error',
                ),
              ).show(context),
              (_) {
                ExtendedNavigator.of(context).popUntil(
                  (route) => route.settings.name == Routes.orderFormPage,
                );
              },
            ),
          ),
          buildWhen: (prevState, currState) =>
              prevState.isSaving != currState.isSaving,
          builder: (context, state) => Stack(
            children: [
              const DepositFormPageScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          ),
        ),
      );
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                'Saving',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DepositFormPageScaffold extends StatelessWidget {
  const DepositFormPageScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<DepositFormBloc, DepositFormState>(
          buildWhen: (prevState, currState) =>
              prevState.isEditing != currState.isEditing,
          builder: (context, state) => Text(
            state.isEditing ? 'Edit Deposit' : 'Add Deposit',
          ),
        ),
        actions: [
          BlocBuilder<DepositFormBloc, DepositFormState>(
            buildWhen: (prevState, currState) =>
                prevState.isEditing != currState.isEditing,
            builder: (context, state) => state.isEditing
                ? IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => context
                        .read<DepositFormBloc>()
                        .add(const DepositFormEvent.deleted()),
                  )
                : Container(),
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => context
                .read<DepositFormBloc>()
                .add(const DepositFormEvent.saved()),
          ),
        ],
      ),
      body: BlocBuilder<DepositFormBloc, DepositFormState>(
        buildWhen: (prevState, currState) =>
            prevState.showErrorMessages != currState.showErrorMessages,
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  AccountNumberField(),
                  NoOfInstallmentsField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
