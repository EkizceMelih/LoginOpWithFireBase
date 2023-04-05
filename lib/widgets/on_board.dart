import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseciddilideneme/sign_in_buttons/internetten_arak.dart';
import 'package:firebaseciddilideneme/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
      stream: _auth.authStatus(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return (snapshot.data != null) ? HomePage() : SignInPage_web();
        } else {
          return Container(
            height: 150,
            width: 100,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
