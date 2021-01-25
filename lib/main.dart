import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstNum;
  int secondNum;
  String textDisplay = "";
  String res;
  String operatorPerform;
  void btnClick(String value) {
    if (value == "C") {
      textDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (value == "+" || value == "-" || value == "x" || value == "/") {
      firstNum = int.parse(textDisplay);
      res = "";
      operatorPerform = value;
    } else if (value == "=") {
      secondNum = int.parse(textDisplay);
      if (operatorPerform == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (operatorPerform == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operatorPerform == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (operatorPerform == "/") {
        res = (firstNum / secondNum).toString();
      }
    } else {
      res = int.parse(textDisplay + value).toString();
    }

    setState(() {
      textDisplay = res;
    });
  }

  Widget customKeypad(String value) {
    return Expanded(
      child: OutlineButton(
        onPressed: () => btnClick(value),
        padding: EdgeInsets.all(25.0),
        child: Text(
          "$value",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textDisplay",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Row(
              children: [
                customKeypad('9'),
                customKeypad('8'),
                customKeypad('7'),
                customKeypad('+'),
              ],
            ),
            Row(
              children: [
                customKeypad('6'),
                customKeypad('5'),
                customKeypad('4'),
                customKeypad('-'),
              ],
            ),
            Row(
              children: [
                customKeypad('3'),
                customKeypad('2'),
                customKeypad('1'),
                customKeypad('x'),
              ],
            ),
            Row(
              children: [
                customKeypad('C'),
                customKeypad('0'),
                customKeypad('='),
                customKeypad('/'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
