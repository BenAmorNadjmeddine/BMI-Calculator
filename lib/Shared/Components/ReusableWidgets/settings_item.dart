import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color backgroundColor;
  final IconData icon;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: backgroundColor,
              foregroundColor: Colors.white,
              child: Icon(icon, size: 24.0),
            ),
            const SizedBox(width: 20.0),
            buildSettingsItemDetails(context),
          ],
        ),
      ),
    );
  }

  Expanded buildSettingsItemDetails(BuildContext context) {
    return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
          );
  }
}
