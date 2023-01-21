import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({
    Key? key,
    required this.onTap,
    this.color = Colors.black87,
    this.icon = Icons.abc,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, size: 40.0, color: color),
    );
  }
}
