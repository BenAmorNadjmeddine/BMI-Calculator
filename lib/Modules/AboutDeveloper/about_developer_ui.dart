import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AboutDeveloperUIComponents/contact_icons.dart';
import 'AboutDeveloperUIComponents/name_and_function.dart';


class AboutDeveloperUI extends StatelessWidget {
  const AboutDeveloperUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CloseButton(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 82.0,
                          backgroundColor: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
                          child: const CircleAvatar(
                            radius: 80.0,
                            backgroundImage: AssetImage("assets/images/Joomi.jpg"),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        NameAndFunction(cubit: cubit, context: context),
                        const SizedBox(height: 20.0),
                        ContactIcons(cubit: cubit, context: context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
