import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class IconMode extends StatelessWidget {
  const IconMode({
    super.key,
    required this.cubit,
    required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
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
