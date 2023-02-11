import 'package:bmi_calculator/Modules/ShowBMIResult/show_bmi_result_ui.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/results_item.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/separator.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:flutter/material.dart';

class ResultsHistoryItems extends StatelessWidget {
  const ResultsHistoryItems({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ResultsItem(
        dismissibleKey: Key(cubit.resultsHistory[index]['id'].toString()),
        bmiColor: defaultColor,
        results: cubit.resultsHistory[index],
        onTap: () {
          navigateTo(
            context,
            ShowBMIResultUI(
              id: cubit.resultsHistory[index]['id'],
              name: cubit.resultsHistory[index]['name'],
              gender: cubit.resultsHistory[index]['gender'],
              age: cubit.resultsHistory[index]['age'].round(),
              height: cubit.resultsHistory[index]['height'],
              weight: cubit.resultsHistory[index]['weight'],
              bmi: cubit.resultsHistory[index]['bmi'],
              resultOfBMI: cubit.resultsHistory[index]['result_of_bmi'] ?? "Error Occurred!",
              comment: cubit.resultsHistory[index]['comment'] ?? "Error Occurred!",
              dateTime: "${cubit.resultsHistory[index]['date']} | ${cubit.resultsHistory[index]['time']}",
            ),
          );
        },
        onDismissed: (direction) {
          cubit.deleteFromDataBase(id: cubit.resultsHistory[index]['id']);
        },
      ),
      separatorBuilder: (context, index) => const Separator(),
      itemCount: cubit.resultsHistory.length,
    );
  }
}
