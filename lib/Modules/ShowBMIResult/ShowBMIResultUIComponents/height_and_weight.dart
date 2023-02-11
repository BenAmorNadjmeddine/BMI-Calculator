import 'package:bmi_calculator/Shared/Components/ReusableWidgets/result_item.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class HeightAndWeight extends StatelessWidget {
  const HeightAndWeight({
    required this.cubit,
    required this.context,
    super.key,
    required this.height,
    required this.weight,
  });


  final AppCubit cubit;
  final BuildContext context;
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ResultItem(
            title: "Height",
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.round().toString(), style: Theme.of(context).textTheme.headline1),
                Text('cm', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
          ),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: ResultItem(
            title: "Weight",
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(weight.round().toString(), style: Theme.of(context).textTheme.headline1),
                Text('Kg', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}