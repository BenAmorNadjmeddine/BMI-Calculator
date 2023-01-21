import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  buildIconMode(cubit, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded buildIconMode(AppCubit cubit, BuildContext context) {
    return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        cubit.isDark ? Icons.sunny : Icons.dark_mode,
                        size: 120.0,
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          cubit.isDark ? 'Light' : 'Dark',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      )
                    ],
                  ),
                );
  }
}
