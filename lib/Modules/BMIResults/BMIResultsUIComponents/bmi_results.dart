import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIResults extends StatelessWidget {
  const BMIResults({
    super.key,
    required this.cubit,
    required this.context,
    required this.textController,
  });

  final AppCubit cubit;
  final BuildContext context;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
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
