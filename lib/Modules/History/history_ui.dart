import 'package:bmi_calculator/Shared/Components/ReusableWidgets/empty_page_message.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HistoryUIComponents/results_history_items.dart';

class HistoryUI extends StatelessWidget {
  const HistoryUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return cubit.resultsHistory.isNotEmpty
            ? ResultsHistoryItems(cubit: cubit)
            : const EmptyPageMessage(
                icon: Icons.calculate_outlined,
                message: "No saved messages yet.",
              );
      },
    );
  }
}
