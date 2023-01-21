import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_button.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/my_text_form_field.dart';
import 'package:bmi_calculator/Shared/Components/ReusableWidgets/rounded_button.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

Widget buildWeightAndAge({
  required BuildContext context,
  required String title,
  required int number,
  required String unit,
  required VoidCallback onPressedOnMinus,
  required VoidCallback onPressedOnPlus,
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppCubit.get(context).isDark ? Colors.black26 : Colors.grey.shade300,
      borderRadius: BorderRadius.circular((20.0)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(number.round().toString(), style: Theme.of(context).textTheme.headline1),
              Text(unit, style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(
                onPressed: onPressedOnMinus,
                icon: Icons.remove,
              ),
              RoundedButton(
                onPressed: onPressedOnPlus,
                icon: Icons.add,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

enum ToastStates {
  success,
  warning,
  error,
}

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void showToast({required String text, required ToastStates state}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showSaveNameDialogBox({
  required BuildContext context,
  required VoidCallback saveButton,
  required VoidCallback cancelButton,
  required TextEditingController textController,
}) {
  showDialog(
    context: context,
    builder: (context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Dialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CloseButton(),
                Text('Write your name', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 40.0),
                MyTextFormField(
                  text: "Name",
                  icon: Icons.person,
                  cursorColor: AppCubit.get(context).isDark ? Colors.grey.shade300 : Colors.black87,
                  textController: textController,
                  onChanged: (String value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Leaving the field empty will register the results as "Unknown"',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 30.0),
                MyButton(
                  onPressed: saveButton,
                  text: 'Save Results',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
