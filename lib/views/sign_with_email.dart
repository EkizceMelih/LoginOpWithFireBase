import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firstly_page/first_page.dart';
import '../service/auth.dart';

enum FormStatus { signIn, register, reset }

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  FormStatus _formStatus = FormStatus.register;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.lock_outline))
      ]),
      body: Center(
        child: _formStatus == FormStatus.signIn
            ? buildSignInForm()
            : _formStatus == FormStatus.register
                ? buildRegisterForm()
                : buildResetForm(),
      ),
    );
  }

  Widget buildSignInForm() {
    TextEditingController _eMailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final _signInFormKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _signInFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Sign in',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _eMailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'E-Mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_signInFormKey.currentState?.validate() == true) {
                    final user = await Provider.of<Auth>(context, listen: false)
                        .signInUserWithEmailandPassword(
                            _eMailController.text, _passwordController.text);
                    if (user?.emailVerified != true) {
                      await _showMyDialog();
                      await Provider.of<Auth>(context, listen: false)
                          .logOutAnon();
                    }
                    Navigator.pop(context);
                  }
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstPage()));
                  });
                },
                child: Text('Sign')),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formStatus = FormStatus.register;
                  });
                },
                child: Text('I have not acc yet')),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formStatus = FormStatus.reset;
                  });
                },
                child: Text('I forgot my password'))
          ],
        ),
      ),
    );
  }

  Widget buildResetForm() {
    TextEditingController _eMailController = TextEditingController();

    final _resetFormKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _resetFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reset password',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _eMailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'E-Mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_resetFormKey.currentState?.validate() == true) {
                    await Provider.of<Auth>(context, listen: false)
                        .sendPasswordResetEmail(_eMailController.text);

                    await _showMyResetDialog();

                    Navigator.pop(context);
                  }
                },
                child: Text('Send')),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterForm() {
    final _registerFormKey = GlobalKey<FormState>();
    TextEditingController _eMailController = TextEditingController();
    TextEditingController _eMailCheckController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordCheckController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Register',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              controller: _eMailController,
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'Please enter your e-mail';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'E-Mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _eMailCheckController,
              validator: (value) {
                if (!EmailValidator.validate(value!)) {
                  return 'Please enter your e-mail';
                } else if (value != _eMailController.text) {
                  return 'Please enter same e-mail';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'E-Mail Check',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (passwordController.text.length < 6) {
                  return 'Your password is very short';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordCheckController,
              validator: (value) {
                if (passwordCheckController.text.length < 6) {
                  return 'Your password is very short';
                } else if (passwordController.text !=
                    passwordCheckController.text) {
                  return 'Your passwords are not same';
                } else {
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: 'Password Check',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_registerFormKey.currentState!.validate()) {
                    final user = await Provider.of<Auth>(context, listen: false)
                        .createUserWithEmailandPassword(
                            _eMailController.text, passwordController.text);

                    if (user != null && !user.emailVerified) {
                      await user.sendEmailVerification();
                    }

                    await _showMyDialog();
                    await Provider.of<Auth>(context, listen: false)
                        .logOutAnon();

                    setState(() {
                      _formStatus = FormStatus.signIn;
                    });
                  }
                },
                child: Text('Register')),
            TextButton(
                onPressed: () {
                  setState(() {
                    _formStatus = FormStatus.signIn;
                  });
                },
                child: Text('I have a acc '))
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Need Approval'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please! check your e-mail address '),
                Text(
                    'First you click the varification link and sign up the application'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OKAY'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyResetDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reset your password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Please! check your e-mail address '),
                Text(
                    'First you click the reset link and sign up the application'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OKAY'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
