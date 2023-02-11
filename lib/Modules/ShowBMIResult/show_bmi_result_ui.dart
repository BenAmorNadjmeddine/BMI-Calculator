import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ShowBMIResultUIComponents/bmi_result.dart';
import 'ShowBMIResultUIComponents/gender_and_age.dart';
import 'ShowBMIResultUIComponents/height_and_weight.dart';
import 'ShowBMIResultUIComponents/icon_buttons.dart';

class ShowBMIResultUI extends StatelessWidget {
  const ShowBMIResultUI({
    Key? key,
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.comment,
    required this.resultOfBMI,
    required this.dateTime,
  }) : super(key: key);

  final int id;
  final String name;
  final String gender;
  final int age;
  final double height;
  final double weight;
  final double bmi;
  final String comment;
  final String resultOfBMI;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
            centerTitle: true,
            elevation: 1,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    dateTime,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 20.0),
                  GenderAndAge(cubit: cubit, context: context, gender: gender, age: age),
                  const SizedBox(height: 20.0),
                  HeightAndWeight(cubit: cubit, context: context, height: height, weight: weight),
                  const SizedBox(height: 20.0),
                  BMIResult(cubit: cubit, context: context, bmi: bmi, resultOfBMI: resultOfBMI),
                  const SizedBox(height: 20.0),
                  IconButtons(cubit: cubit, context: context, id: id),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
