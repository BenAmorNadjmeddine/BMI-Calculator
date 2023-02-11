import 'package:bmi_calculator/Shared/Components/ReusableWidgets/contact_item.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactIcons extends StatelessWidget {
  const ContactIcons({
    super.key, required this.cubit, required this.context,
  });

  final AppCubit cubit;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 25.0,
      children: [
        ContactItem(
          onTap: () {
            cubit.lunchEmail();
          },
          icon: FontAwesomeIcons.squareEnvelope,
          color: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
        ),
        ContactItem(
          onTap: () {
            cubit.launchWhatsApp(context);
          },
          icon: FontAwesomeIcons.squareWhatsapp,
          color: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
        ),
        ContactItem(
          onTap: () {
            cubit.launchLinkedIn(context);
          },
          icon: FontAwesomeIcons.linkedin,
          color: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
        ),
        ContactItem(
          onTap: () {
            cubit.launchGitHub(context);
          },
          icon: FontAwesomeIcons.squareGithub,
          color: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
        ),
      ],
    );
  }
}
