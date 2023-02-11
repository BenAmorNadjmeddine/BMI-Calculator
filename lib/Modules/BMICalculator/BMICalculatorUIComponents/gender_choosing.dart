import 'package:bmi_calculator/Shared/Components/ReusableWidgets/gender_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:flutter/material.dart';

class GenderChoosing extends StatelessWidget {
  const GenderChoosing({
    super.key, required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderButton(
            onTap: () {
              if (!cubit.isGenderChosen) cubit.isGenderChosen = !cubit.isGenderChosen;
              cubit.changeGender(true);
            },
            text: 'Male',
            icon: Icons.male,
            color: cubit.isGenderChosen
                ? cubit.isMale!
                    ? defaultColor
                    : cubit.isDark
                        ? Colors.black26
                        : Colors.grey.shade300
                : cubit.isDark
                    ? Colors.black26
                    : Colors.grey.shade300,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: GenderButton(
            onTap: () {
              if (!cubit.isGenderChosen) cubit.isGenderChosen = !cubit.isGenderChosen;
              cubit.changeGender(false);
            },
            text: 'Female',
            icon: Icons.female,
            color: cubit.isGenderChosen
                ? !cubit.isMale!
                    ? defaultColor
                    : cubit.isDark
                        ? Colors.black26
                        : Colors.grey.shade300
                : cubit.isDark
                    ? Colors.black26
                    : Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
