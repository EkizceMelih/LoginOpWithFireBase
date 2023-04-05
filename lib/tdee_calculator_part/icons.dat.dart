import 'package:flutter/material.dart';

class myColumn extends StatelessWidget {
  final String string_sex;
  final IconData sex_icon;
  myColumn({this.sex_icon = Icons.add, this.string_sex = "Default"});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          sex_icon,
          size: 60,
          color: Colors.redAccent,
        ),
        Text(
          string_sex,
        ),
      ],
    );
  }
}
