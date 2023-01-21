import 'package:bmi_calculator/Shared/Components/ReusableWidgets/separator.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/settings_item.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          itemBuilder: (context, index) => buildSettingsItems(context, cubit, index),
          separatorBuilder: (context, index) => const Separator(),
          itemCount: cubit.settingsTitles.length,
        );
      },
    );
  }

  SettingsItem buildSettingsItems(BuildContext context, AppCubit cubit, int index) {
    return SettingsItem(
      onTap: () {
        navigateTo(context, cubit.settingsScreens[index]);
      },
      backgroundColor: cubit.isDark ? Colors.black26 : Colors.grey.shade700,
      icon: cubit.settingsIcons[index],
      title: cubit.settingsTitles[index],
      subtitle: cubit.settingsSubtitles[index],
    );
  }
}
