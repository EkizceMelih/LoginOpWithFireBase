import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseciddilideneme/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'intro_page/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initilazion = Firebase.initializeApp();
  static final String title = 'Onboarding Example';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: OnBoardingPage(),
      ),
    );
  }
}
