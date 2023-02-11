import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class NameAndFunction extends StatelessWidget {
  const NameAndFunction({
    super.key, required this.cubit, required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ben Amor Nadjmeddine",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5.0),
            Text(
              "Flutter Mobile Developer",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
