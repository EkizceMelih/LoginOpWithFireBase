import 'package:flutter/material.dart';

import 'icons.dat.dart';
import 'myContainer.dart';
import 'result_data.dart';
import 'text_style.dart';
import 'user_data.dart';

class InputFiles extends StatefulWidget {
  const InputFiles({Key? key}) : super(key: key);

  @override
  State<InputFiles> createState() => _InputFilesState();
}

class _InputFilesState extends State<InputFiles> {
  String choosen_sex = "";
  double age = 0;
  double exercise = 0;
  int height = 170;
  int weight = 50;
  double fat_rate = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              'TDEE Calculator',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: buildRow('Height'),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      child: buildRow('Weight'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: myContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How Many Times a Week Do You Exercise?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    activeColor: Colors.purple,
                    min: 0,
                    max: 7,
                    divisions: 7,
                    value: exercise,
                    onChanged: (double newValue) {
                      setState(() {
                        exercise = newValue;
                      });
                    },
                  ),
                  Text(
                    '${exercise.round()}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: myContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'How old are you?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    activeColor: Colors.purple,
                    min: 0,
                    max: 100,
                    value: age,
                    onChanged: (double newValue) {
                      setState(() {
                        age = newValue;
                      });
                    },
                  ),
                  Text(
                    '${age.round()}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: myContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Fat rate? (Optional)',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    activeColor: Colors.purple,
                    min: 0,
                    max: 100,
                    value: fat_rate,
                    onChanged: (double newValue) {
                      setState(() {
                        fat_rate = newValue;
                      });
                    },
                  ),
                  Text(
                    '%${fat_rate.round()}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      choosen_sex = 'Woman';
                    });
                  },
                  child: myContainer(
                    color_data:
                        choosen_sex == 'Woman' ? Colors.purple : Colors.white,
                    child: myColumn(sex_icon: Icons.woman, string_sex: 'Woman'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      choosen_sex = 'Man';
                    });
                  },
                  child: myContainer(
                    color_data:
                        choosen_sex == 'Man' ? Colors.blueAccent : Colors.white,
                    child: myColumn(sex_icon: Icons.man, string_sex: 'Man'),
                  ),
                ),
              ),
            ],
          )),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(UserData(
                            choosen_sex: choosen_sex,
                            age: age,
                            fat_rate: fat_rate,
                            exercise: exercise,
                            height: height,
                            weight: weight,
                          ))));
            },
            child: Text('Calculate', style: calculator),
          )
        ]));
  }

  Row buildRow(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(text),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            text == 'Height' ? '$height' : ' $weight',
            style: style1,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  text == 'Height' ? height++ : weight++;
                });
              },
              child: Icon(Icons.add, color: Colors.white),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  text == 'Height' ? height-- : weight--;
                });
              },
              child: Icon(Icons.minimize, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
