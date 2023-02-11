import 'package:bmi_calculator/Shared/Components/ReusableWidgets/result_item.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class GenderAndAge extends StatelessWidget {
  const GenderAndAge({
    super.key,
    required this.cubit,
    required this.context,
    required this.gender,
    required this.age,
  });

  final AppCubit cubit;
  final BuildContext context;
  final String gender;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ResultItem(
            title: gender,
            widget: Icon(gender == 'Male' ? Icons.male : Icons.female, size: 60.0),
            color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: ResultItem(
            title: "Age",
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(age.toString(), style: Theme.of(context).textTheme.headline1),
                Text('yrs', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
