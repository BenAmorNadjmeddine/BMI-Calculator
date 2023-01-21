import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({
    Key? key,
    this.title = 'Something',
    required this.widget,
    this.color = Colors.black26,
  }) : super(key: key);

  final String title;
  final Widget widget;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular((20.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            Text(title, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}