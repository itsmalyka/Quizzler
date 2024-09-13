import 'package:flutter/material.dart';
import 'package:myquizapp/QuizScreen.dart';
import 'package:myquizapp/home.dart';
import 'Question.dart';
import 'data.dart';
import 'MyElevatedButton.dart';
void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home(),
    );
  }
}

