import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  var firstNum;
  var secondNum;
  var textToDisplay = "";
  var res;
  var operatorToPerform;
  void btnClicked(String btnval) {
    if (btnval == 'C') {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operatorToPerform = btnval;
    } else if (btnval == "=") {
      secondNum = int.parse(textToDisplay);
      if (operatorToPerform == "+") {
        res = (firstNum + secondNum).toString();
        print(res);
      }
      if (operatorToPerform == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operatorToPerform == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (operatorToPerform == "/") {
        res = (firstNum / secondNum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();

      setState(() {
        textToDisplay = res;
      });
    }
  }

  Widget customButton(String btnval) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(btnval),
        child: Text(
          "$btnval",
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalculatorR'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textToDisplay",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customButton("9"),
                customButton("8"),
                customButton("7"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("6"),
                customButton("5"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("3"),
                customButton("2"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
