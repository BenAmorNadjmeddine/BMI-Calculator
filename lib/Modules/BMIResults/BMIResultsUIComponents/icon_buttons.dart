import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_icon_button.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    super.key,
    required this.cubit,
    required this.context,
    required this.textController,
    required this.gender,
  });

  final AppCubit cubit;
  final BuildContext context;
  final TextEditingController textController;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MyIconButton(
            onTap: () {
              showSaveNameDialogBox(
                context: context,
                textController: textController,
                saveButton: () {
                  FocusScope.of(context).unfocus();
                  cubit.insertIntoDataBase(
                    context: context,
                    name: textController.text == "" ? "Unknown" : textController.text,
                    gender: gender,
                    date: DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    time: DateFormat('kk:mm:ss').format(DateTime.now()),
                    age: cubit.ageValue,
                    height: cubit.heightValue,
                    weight: cubit.weightValue,
                    bmi: cubit.bmiResults!,
                    resultOfBMI: cubit.resultOfBMI,
                    comment: cubit.comment!,
                  );
                  textController.clear();
                  cubit.restartCalculation(context);
                  cubit.currentIndex = 1;
                },
                cancelButton: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pop(context);
                  textController.clear();
                },
              );
            },
            icon: Icons.save,
            text: "Save",
          ),
        ),
        Expanded(
          child: MyIconButton(
            onTap: () {
              cubit.restartCalculation(context);
            },
            icon: Icons.refresh,
            text: "Restart",
          ),
        ),
        Expanded(
          child: MyIconButton(
            onTap: () {
              Share.share(
                'My BMI results:\nBMI = ${cubit.bmiResults}\n\nStudies say that:\n"${cubit.comment}"',
                subject: 'BMI Results',
              );
            },
            icon: Icons.share,
            text: "Share",
          ),
        ),
      ],
    );
  }
}
