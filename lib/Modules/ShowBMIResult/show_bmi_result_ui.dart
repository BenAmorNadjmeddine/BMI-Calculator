import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_icon_button.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/result_item.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

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
            child: Column(
              children: [
                Text(
                  dateTime,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 20.0),
                buildGenderAndAge(cubit, context),
                const SizedBox(height: 20.0),
                buildHeightAndWeight(context, cubit),
                const SizedBox(height: 20.0),
                buildBMIResult(cubit, context),
                const SizedBox(height: 20.0),
                buildIconButtons(cubit, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Row buildIconButtons(AppCubit cubit, BuildContext context) {
    return Row(
                children: [
                  Expanded(
                    child: MyIconButton(
                      onTap: () {
                        cubit.deleteFromDataBase(id: id);
                        Navigator.pop(context);
                      },
                      icon: Icons.delete,
                      text: "Delete",
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

  Expanded buildBMIResult(AppCubit cubit, BuildContext context) {
    return Expanded(
                flex: 4,
                child: Container(
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
                ),
              );
  }

  Expanded buildHeightAndWeight(BuildContext context, AppCubit cubit) {
    return Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: ResultItem(
                        title: "Height",
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.round().toString(), style: Theme.of(context).textTheme.headline1),
                            Text('cm', style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: ResultItem(
                        title: "Weight",
                        widget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.round().toString(), style: Theme.of(context).textTheme.headline1),
                            Text('Kg', style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              );
  }

  Expanded buildGenderAndAge(AppCubit cubit, BuildContext context) {
    return Expanded(
                flex: 4,
                child: Row(
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
                ),
              );
  }
}
