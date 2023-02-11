import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class ResetConfirmingMessage extends StatelessWidget {
  const ResetConfirmingMessage({
    super.key,
    required this.cubit,
    required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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