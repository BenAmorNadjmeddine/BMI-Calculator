import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  const GenderButton({
    Key? key,
    this.text = 'Something',
    this.icon = Icons.abc,
    this.color = Colors.black26,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular((20.0)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Icon(icon, size: 75.0),
              Text(text, style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
    );
  }
}