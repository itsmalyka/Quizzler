import 'package:flutter/material.dart';
import 'package:myquizapp/resultScreen.dart';
import 'Question.dart';
import 'data.dart';
import 'MyElevatedButton.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:html/parser.dart' as htmlParser;


class QuizScreen extends StatefulWidget {
  String category;
  String difficulty;
  QuizScreen({required this.category,required this.difficulty});


  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;


  @override
  void initState() {
    super.initState();
    fetchQuestions(widget.category,widget.difficulty).then((value) {
      setState(() {
        questions = value;
      });
    });
  }

  void answerQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;
      });
    }
    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>resultScreen(score: score,totalQuestions: questions.length,)));
      // Navigate to score screen or show a dialog with final score

    }
  }

  @override
  Widget build(BuildContext context) {
    int totalQuestions=questions.length;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          'Quiz App',
          style: TextStyle(fontSize: 20, color: Colors.white60),
        ),
        backgroundColor: Colors.black87,
        /*flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Colors.blue]),
          ),
        ),*/
      ),
      body: questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    questions[currentQuestionIndex].question,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25.0),
                  ...questions[currentQuestionIndex]
                      .incorrectAnswers
                      .map((option) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyElevatedButton(
                        width: 150,
                        height: 50,
                        onPressed: () => answerQuestion(option),
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          option,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        gradientcolor1: Colors.cyan,
                        gradientcolor2: Colors.indigo,
                      ),
                    );
                    /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
                    textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(color: Colors.black54)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(16)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: () => answerQuestion(option),
                  child: Text(option,style: TextStyle(color: Colors.white),),
                ),
              );*/
                  }),
                  SizedBox(height: 30.0),
                  MyElevatedButton(
                      onPressed: () => goToNextQuestion(),
                      child: Text(
                        'Next Question',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150, // Set the width of the gauge
                    height: 150, // Set the height of the gauge
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 0,
                          maximum: totalQuestions.toDouble(),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: currentQuestionIndex.toDouble(),
                              color: Colors.indigo,
                            ),
                          ],
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: currentQuestionIndex.toDouble(),
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              positionFactor: 0.1,
                              angle: 90,
                              widget: Text(
                                '${currentQuestionIndex + 1} / $totalQuestions',
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
    );
  }
}
