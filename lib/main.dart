import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "랜덤 이모티콘",
      theme: new ThemeData(
          primaryColor: Colors.yellow
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("랜덤 이모지", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.yellow,

        ),
        body: Container(
            child: new BodyPanel(
            ),
            color: Colors.greenAccent
        ),

      ),
    );
  }
}

class BodyPanel extends StatefulWidget {
  @override
  _BodyPanelState createState() => _BodyPanelState();
}

class _BodyPanelState extends State<BodyPanel> {


  int _counter = 0;
  int leftDice = 0;

  List<String> emotion = [
    "goodnight",
    "hungry",
    "ignore",
    "sleepy",
    "surprise",
    "yummy",
    "daram",
    "bird"
  ];
  static String emotionName = "thank";
  static String  url = 'images/$emotionName.png';
  void _incrementCounter()
  {
    setState
      (
            ()
        {
          _counter++;
          leftDice = Random().nextInt(emotion.length);
          emotionName = emotion[leftDice];
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text
          (
            '버튼 누르면 이모지 변경'
        ),
        Text
          (
          '$emotionName',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          onPressed: _incrementCounter,
          child:
          const Text(
            "눌러눌러",
            style: TextStyle(fontSize: 20),
          ),
        ),


        Image(image: AssetImage('images/$emotionName.png'),width : 400,height : 300, fit : BoxFit.fill),
      ],
    );
  }
}