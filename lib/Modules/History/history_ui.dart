import 'package:bmi_calculator/Modules/ShowBMIResult/show_bmi_result_ui.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/results_item.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/separator.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:bmi_calculator/Shared/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryUI extends StatelessWidget {
  const HistoryUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.resultsHistory.isNotEmpty ? buildResultsItem(cubit) : buildEmptyHistoryMessage();
      },
    );
  }

  ListView buildResultsItem(AppCubit cubit) {
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

  Center buildEmptyHistoryMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.calculate_outlined, size: 65.0, color: Colors.grey),
          Text(
            "No saved results.",
            style: TextStyle(fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
