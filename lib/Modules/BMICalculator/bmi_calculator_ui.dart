import 'package:bmi_calculator/Modules/BMIResults/bmi_results_ui.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/gender_button.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICalculatorUI extends StatelessWidget {
  const BMICalculatorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                buildGenderChoosing(cubit),
                const SizedBox(height: 20.0),
                buildHeightSlider(cubit, context),
                const SizedBox(height: 20.0),
                buildWeightAndHeight(context, cubit),
                const SizedBox(height: 20.0),
                MyButton(
                  onPressed: () {
                    if (!cubit.isGenderChosen) {
                      // Proceed to write Name
                      showToast(
                        text: 'Please choose your gender',
                        state: ToastStates.error,
                      );
                    } else {
                      navigateTo(
                        context,
                        BMIResultsUI(
                          gender: cubit.isMale! ? "Male" : "Female",
                          age: cubit.ageValue,
                          height: cubit.heightValue,
                          weight: cubit.weightValue,
                        ),
                      );
                    }
                  },
                  text: 'Calculate',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row buildGenderChoosing(AppCubit cubit) {
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

  Container buildHeightSlider(AppCubit cubit, BuildContext context) {
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
            Text('Height', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  cubit.heightValue.round().toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text('cm', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            const SizedBox(height: 4.0),
            Slider(
              value: cubit.heightValue,
              min: 140.0,
              max: 220.0,
              onChanged: (value) {
                cubit.changeHeightValue(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Row buildWeightAndHeight(BuildContext context, AppCubit cubit) {
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
