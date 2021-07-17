import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ball Roll Picker "),
              Icon(Icons.sports_football),
            ],
          ),
        ),
        body: randomNumberPage(),
      ),
    );
  }
}

class randomNumberPage extends StatefulWidget {
  @override
  _randomNumberPageState createState() => _randomNumberPageState();
}

class _randomNumberPageState extends State<randomNumberPage> {
  var minValue = 0;
  var maxValue = 0;
  var randomValue = 0;
  //@override
  final controllerMin = TextEditingController();
  final controllerMax = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    controllerMin.dispose();
    controllerMax.dispose();
    super.dispose();
  }

  mixNow() {
    if (controllerMin.text.isEmpty || controllerMax.text.isEmpty) {
      print("one/both textfield is/are empty");
    } else {
      print(controllerMin.text);
      minValue = int.parse(controllerMin.text);
      maxValue = int.parse(controllerMax.text);
      print(minValue);
      //minValue = Random().nextInt(minValue) + 5;
      randomValue = Random().nextInt(maxValue - minValue + 1) + minValue;
      print("the random value is " + randomValue.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$randomValue",
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controllerMin,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'MIN VALUE',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: controllerMax,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'MAX VALUE',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shuffle),
        onPressed: () {
          print("MAX Value = " + controllerMax.text);
          print("MIN Value = " + controllerMin.text);
          setState(() {
            mixNow();
          });
        },
      ),
    );
  }
}
