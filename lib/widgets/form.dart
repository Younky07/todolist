import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_value.dart';

class Field extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const Field(
      {Key? key,
      required this.title,
      required this.hint,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.fromLTRB(30, 10, 0, 5),
        child: Text(
          title,
          style: TextStyle(
              fontSize:
                  ResponsiveValue(context, defaultValue: 15.0, valueWhen: [
                Condition.smallerThan(name: MOBILE, value: 10.0),
                Condition.largerThan(name: TABLET, value: 20.0)
              ]).value,
              fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        width: ResponsiveValue(context, defaultValue: 350.0, valueWhen: const [
          Condition.largerThan(name: TABLET, value: 700.0),
          Condition.largerThan(name: DESKTOP, value: 1000.0)
        ]).value,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(),
            hintText: hint,
          ),
        ),
      ),
    ]);
  }
}
