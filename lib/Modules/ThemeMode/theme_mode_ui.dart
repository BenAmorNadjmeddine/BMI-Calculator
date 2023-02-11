import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ThemeModeUIComponents/icon_mode.dart';

class ThemeModeUI extends StatelessWidget {
  const ThemeModeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: InkWell(
              onTap: () {
                cubit.changeAppMode();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20.0),
                  const CloseButton(),
                  IconMode(cubit: cubit, context: context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}