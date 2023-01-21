import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_icon_button.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
                  buildBMIResults(cubit, context),
                  const SizedBox(height: 20.0),
                  buildIconButtons(context, textController, cubit),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildIconButtons(BuildContext context, TextEditingController textController, AppCubit cubit) {
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

  Expanded buildBMIResults(AppCubit cubit, BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular((20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FontAwesomeIcons.fire, color: defaultColor, size: 100.0),
              Text(
                cubit.bmiResults.toString(),
                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 85.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BMI = ${cubit.bmiResults} kg/m",
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey.shade600),
                  ),
                  Text(
                    "2",
                    softWrap: true,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                cubit.comment!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
