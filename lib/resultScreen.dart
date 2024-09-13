import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:myquizapp/MyElevatedButton.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart'; // Import Syncfusion gauges
import 'dart:math';

class resultScreen extends StatefulWidget {
  final int score;
  final int totalQuestions;

  resultScreen({required this.score, required this.totalQuestions});

  @override
  State<resultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<resultScreen> {
  final confetti = ConfettiController(duration: Duration(seconds: 10));

  @override
  void initState() {
    super.initState();
    confetti.play();
  }

  @override
  void dispose() {
    confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = widget.totalQuestions > 0 ? (widget.score / widget.totalQuestions) * 100 : 0;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.black87,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Text(
              "Result",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              MyElevatedButton(onPressed: (){}, height:50,width:350,child: Text('Your Result',style: TextStyle(color: Colors.white,fontSize: 25),)),
              SizedBox(height: 20),
              Container(
                height: 250,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: widget.totalQuestions.toDouble(),
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: widget.score.toDouble(),
                          color: Colors.indigo,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: widget.score.toDouble(),
                          color: Colors.pink,
                          width: 0.15,
                          sizeUnit: GaugeSizeUnit.factor,
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.1,
                          angle: 90,
                          widget: Text(
                            '${widget.score} / ${widget.totalQuestions}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
        ConfettiWidget(
          confettiController: confetti,
          blastDirection: pi / 2,
          colors: [Colors.pink, Colors.cyan, Colors.indigo],
        ),
      ],
    );
  }
}
