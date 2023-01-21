import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required this.textController,
    this.cursorColor = Colors.black87,
    this.text = "Something",
    this.icon = Icons.abc,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final TextEditingController textController;
  final Color cursorColor;
  final String text;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      textInputAction: TextInputAction.done,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(text),
        ),
        prefixIcon: Icon(icon),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
