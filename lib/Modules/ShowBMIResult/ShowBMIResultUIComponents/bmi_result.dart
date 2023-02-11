import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  const BMIResult({
    super.key,
    required this.cubit,
    required this.context,
    required this.bmi,
    required this.resultOfBMI,
  });

  final AppCubit cubit;
  final BuildContext context;
  final double bmi;
  final String resultOfBMI;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular((20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI = $bmi',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                resultOfBMI,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}