import 'package:bmi_calculator/Shared/Components/ReusableWidgets/separator.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SettingsUIComponents/settings_items.dart';

class SettingsUI extends StatelessWidget {
  const SettingsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => SettingsItems(
            context: context,
            cubit: cubit,
            index: index,
          ),
          separatorBuilder: (context, index) => const Separator(),
          itemCount: cubit.settingsTitles.length,
        );
      },
    );
  }
}
