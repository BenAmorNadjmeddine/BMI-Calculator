import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({
    super.key,
    required this.cubit,
    required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular((20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Height', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  cubit.heightValue.round().toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text('cm', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            const SizedBox(height: 4.0),
            Slider(
              value: cubit.heightValue,
              min: 140.0,
              max: 220.0,
              onChanged: (value) {
                cubit.changeHeightValue(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
