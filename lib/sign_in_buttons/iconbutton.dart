import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.logout),
      iconSize: 10,
      color: Colors.white,
    );
  }
}
