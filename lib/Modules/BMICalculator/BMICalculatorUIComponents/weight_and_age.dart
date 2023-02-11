import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class WeightAndAge extends StatelessWidget {
  const WeightAndAge({
    super.key, required this.cubit, required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildWeightAndAge(
            context: context,
            title: 'Weight',
            number: cubit.weightValue.round(),
            unit: 'Kg',
            onPressedOnMinus: () {
              cubit.minusWeightValue();
            },
            onPressedOnPlus: () {
              cubit.addWeightValue();
            },
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: buildWeightAndAge(
            context: context,
            title: 'Age',
            number: cubit.ageValue,
            unit: 'yrs',
            onPressedOnMinus: () {
              cubit.minusAgeValue();
            },
            onPressedOnPlus: () {
              cubit.addAgeValue();
            },
          ),
        ),
      ],
    );
  }
}
