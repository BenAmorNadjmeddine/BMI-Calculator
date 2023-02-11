import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BMIResultsUIComponents/bmi_results.dart';
import 'BMIResultsUIComponents/icon_buttons.dart';

class BMIResultsUI extends StatelessWidget {
  const BMIResultsUI({
    Key? key,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  }) : super(key: key);

  final String gender;
  final int age;
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        cubit.calculateBMI(
          age: age,
          gender: gender,
          weight: weight,
          height: height,
        );
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  BMIResults(
                    cubit: cubit,
                    context: context,
                    textController: textController,
                  ),
                  const SizedBox(height: 20.0),
                  IconButtons(
                    cubit: cubit,
                    context: context,
                    textController: textController,
                    gender: gender,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
