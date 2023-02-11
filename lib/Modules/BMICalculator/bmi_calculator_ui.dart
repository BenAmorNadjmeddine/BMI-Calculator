import 'package:bmi_calculator/Modules/BMIResults/bmi_results_ui.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BMICalculatorUIComponents/gender_choosing.dart';
import 'BMICalculatorUIComponents/height_slider.dart';
import 'BMICalculatorUIComponents/weight_and_age.dart';

class BMICalculatorUI extends StatelessWidget {
  const BMICalculatorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                GenderChoosing(cubit: cubit),
                const SizedBox(height: 20.0),
                HeightSlider(cubit: cubit, context: context),
                const SizedBox(height: 20.0),
                WeightAndAge(cubit: cubit, context: context),
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
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
