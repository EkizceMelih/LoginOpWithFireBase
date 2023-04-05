import 'package:firebaseciddilideneme/views/sign_with_email.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../service/auth.dart';
import '../views/sign_in_page.dart';

class SignInPage_web extends StatefulWidget {
  @override
  State<SignInPage_web> createState() => _SignInPage_webState();
}

class _SignInPage_webState extends State<SignInPage_web> {
  /// Show a simple "___ Button Pressed" indicator
  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider Button Pressed!'),
        backgroundColor: Colors.black26,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }

  /// Normally the signin buttons should be contained in the SignInPage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in'), actions: [
        IconButton(
            onPressed: () async {
              Provider.of<Auth>(context, listen: false).logOutAnon();
            },
            icon: Icon(Icons.logout))
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButtonBuilder(
              text: 'Get going with Email',
              icon: Icons.email,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmailSignInPage()));
              },
              backgroundColor: Colors.blueGrey[700]!,
              width: 220.0,
            ),
            /*MyElevatedButton(
              title: 'Sign in anonly',
            ),*/
            SignInButton(
              Buttons.google,
              text: "with Google Coming SOON",
              onPressed: () async {
                final user = await Provider.of<Auth>(context, listen: false)
                    .signInWithGoogle();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            SignInButton(
              Buttons.facebook,
              text: "with FaceBook Soon",
              onPressed: () async {
                final user = await Provider.of<Auth>(context, listen: false)
                    .signInWithGoogle();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            SignInButton(
              Buttons.appleDark,
              text: "with Apple Soon",
              onPressed: () async {
                final user = await Provider.of<Auth>(context, listen: false)
                    .signInWithGoogle();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            SignInButton(
              Buttons.reddit,
              text: "with Reddit",
              onPressed: () async {
                final user = await Provider.of<Auth>(context, listen: false)
                    .signInWithGoogle();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            SignInButton(
              Buttons.linkedIn,
              text: "with LinkedIn",
              onPressed: () async {
                final user = await Provider.of<Auth>(context, listen: false)
                    .signInWithGoogle();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
