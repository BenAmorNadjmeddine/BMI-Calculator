import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetDataUI extends StatelessWidget {
  const ResetDataUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CloseButton(),
                  buildResetConfirmingMessage(context, cubit),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded buildResetConfirmingMessage(BuildContext context, AppCubit cubit) {
    return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Reset data will erase all of your results history and theme mode.\n\nDo you want to proceed?",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 20.0),
                      MyButton(
                        onPressed: () {
                          cubit.resetAppData(context);
                        },
                        text: 'Reset',
                      ),
                    ],
                  ),
                );
  }
}
