import 'package:flutter/material.dart';

class ResultsItem extends StatelessWidget {
  const ResultsItem({
    Key? key,
    this.results,
    required this.dismissibleKey,
    this.bmiColor = Colors.black26,
    this.onDismissed,
    this.onTap,
  }) : super(key: key);

  final Map? results;
  final Key dismissibleKey;
  final Color bmiColor;
  final Function(DismissDirection)? onDismissed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: dismissibleKey,
      onDismissed: onDismissed,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBMIBox(context),
              const SizedBox(width: 15.0),
              buildHistoryItemDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBMIBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
                color: bmiColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "BMI",
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                      ),
                      Text(
                        "${results!["bmi"]}",
                        style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

  Expanded buildHistoryItemDetails(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${results!["result_of_bmi"]}",
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 22.0),
          ),
          Text(
            "Name : ${results!["name"]}",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey),
          ),
          Text(
            "${results!["date"]} | ${results!["time"]}",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
