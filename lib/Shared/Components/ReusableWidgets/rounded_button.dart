import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    this.icon = Icons.abc,
    this.size = 12.0,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;

  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(size),
      ),
      child: Icon(icon),
    );
  }
}
