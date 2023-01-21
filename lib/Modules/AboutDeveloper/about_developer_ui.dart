import 'package:bmi_calculator/Shared/Components/ReusableWidgets/contact_item.dart';
import 'package:bmi_calculator/Shared/Cubit/cubit.dart';
import 'package:bmi_calculator/Shared/Cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutDeveloperUI extends StatelessWidget {
  const AboutDeveloperUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CloseButton(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 82.0,
                          backgroundColor: cubit.isDark ? Colors.grey.shade300 : Colors.black87,
                          child: const CircleAvatar(
                            radius: 80.0,
                            backgroundImage: AssetImage("assets/images/Joomi.jpg"),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        buildNameAndFunction(cubit, context),
                        const SizedBox(height: 20.0),
                        buildContactIcons(cubit, context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Container buildNameAndFunction(AppCubit cubit, BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: cubit.isDark ? Colors.black26 : Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ben Amor Nadjmeddine",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5.0),
            Text(
              "Flutter Mobile Developer",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Wrap buildContactIcons(AppCubit cubit, BuildContext context) {
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
