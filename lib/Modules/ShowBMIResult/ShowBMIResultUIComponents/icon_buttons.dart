import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_icon_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class IconButtons extends StatelessWidget {
  const IconButtons({
    super.key,
    required this.id,
    required this.cubit,
    required this.context,
  });

  final int id;
  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyIconButton(
            onTap: () {
              cubit.deleteFromDataBase(id: id);
              Navigator.pop(context);
            },
            icon: Icons.delete,
            text: "Delete",
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
