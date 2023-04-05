import 'package:flutter/material.dart';

import 'calculating.dart';
import 'text_style.dart';
import 'user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
                child: Text(
              '${Calculating(userData).TDEE().round()} ',
            )),
          ),
          Expanded(
              flex: 1,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back', style: calculator),
              )),
        ],
      ),
    );
  }
}
