import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth.dart';

class MyElevatedButton extends StatefulWidget {
  @override
  final String title;

  const MyElevatedButton({super.key, required this.title});

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  bool _isLoading = false;
  Future<void> myEnableFunc() async {
    setState(() {
      _isLoading = true;
    });
    final user = await Provider.of<Auth>(context, listen: false).signInAnon();
    setState(() {
      _isLoading = false;
    });
    print('${user?.uid}');
  }

  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _isLoading ? null : myEnableFunc,
      child: Text(widget.title),
    );
  }
}

class MyQuitButton extends StatelessWidget {
  @override
  final String title;

  const MyQuitButton({super.key, required this.title});

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        print('tıklandı');
      },
      child: Text(title),
      style: ButtonStyle(),
    );
  }
}
