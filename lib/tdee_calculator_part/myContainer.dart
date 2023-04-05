import 'package:flutter/material.dart';

class myContainer extends StatelessWidget {
  Widget child;
  Color color_data;

  myContainer({required this.child, this.color_data = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.5),
          color: color_data,
        ),
      ),
    );
  }
}
