import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../sign_in_buttons/internetten_arak.dart';
import 'button.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Many people are trying to lose or gain weight.',
              body:
                  'Gaining or losing weight is all a matter of will and math.',
              image: buildImage('assets/images/My project.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Scientific Calorie Calculator',
              body:
                  'Analyzes the amount of calories you need and prepares a program that suits you.',
              image: buildImage('assets/images/sporcuşar.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Calorie Deficit and Calorie Surplus',
              body:
                  'After entering the requested information, see the amount of calories you need. Create a calorie deficit.',
              image: buildImage('assets/images/kasliadam.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Be Water My Friend',
              body: 'Empty your mind and start the your journey.',
              footer: ButtonWidget(
                text: 'GO TO TDEE Calculator',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/images/11559.png'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text('GO',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Container(
            color: Colors.transparent,
            child: Text(
              'Skip',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 21),
            ),
          ),
          onSkip: () => goToHome(context),
          next: Icon(Icons.arrow_forward, color: Colors.white),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          dotsFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SignInPage_web()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
