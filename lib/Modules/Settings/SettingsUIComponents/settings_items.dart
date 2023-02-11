import 'package:bmi_calculator/Shared/Components/ReusableWidgets/settings_item.dart';
import 'package:bmi_calculator/Shared/Components/components.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({
    super.key,
    required this.cubit,
    required this.context,
    required this.index,
  });

  final AppCubit cubit;
  final BuildContext context;
  final int index;

  @override
  Widget build(BuildContext context) {
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
