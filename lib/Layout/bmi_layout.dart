import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMILayout extends StatelessWidget {
  const BMILayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.title[cubit.currentIndex],
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: cubit.bottomNavigationBarItems,
          ),
        );
      },
    );
  }
}
