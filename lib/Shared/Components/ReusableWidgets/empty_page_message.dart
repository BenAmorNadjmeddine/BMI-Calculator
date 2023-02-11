import 'package:flutter/material.dart';

class EmptyPageMessage extends StatelessWidget {
  const EmptyPageMessage({
    super.key,
    this.icon = Icons.error,
    this.message = "Nothing yet.",
  });

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 65.0, color: Colors.grey),
          Text(
            message,
            style: const TextStyle(fontSize: 18.0, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
