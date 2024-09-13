import 'package:flutter/material.dart';
import 'package:myquizapp/QuizScreen.dart';
import 'MyElevatedButton.dart';

class difficultyScreen extends StatefulWidget {
  final String category;
  final String difficulty;

  const difficultyScreen(
      {Key? key, required this.category, this.difficulty = 'Easy'})
      : super(key: key);

  @override
  _DifficultyScreenState createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<difficultyScreen> {
  void openQuizScreen(String difficulty) {
    Widget screen;
    switch (widget.category) {
      case 'Science':
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
      case 'Math':
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
      case 'Entertainment':
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
      case 'E-gaming':
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
      case 'Computer':
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
      default:
        screen = QuizScreen(
            category: widget.category, difficulty: widget.difficulty);
        break;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>screen),);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade900, Colors.indigo.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyElevatedButton(
                    width: 300,
                    height: 50,
                    onPressed: () {
                      openQuizScreen('Easy');
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      'Easy',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    gradientcolor1: Colors.cyan,
                    gradientcolor2: Colors.indigo,
                    icon: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyElevatedButton(
                    width: 300,
                    height: 50,
                    onPressed: () {
                      openQuizScreen('Medium');
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      'Medium',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    gradientcolor1: Colors.cyan,
                    gradientcolor2: Colors.indigo,
                    icon: Icon(Icons.arrow_forward),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyElevatedButton(
                    width: 300,
                    height: 50,
                    onPressed: () {
                      openQuizScreen('difficult');
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text(
                      'Difficult',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    icon: Icon(Icons.arrow_forward),
                    gradientcolor1: Colors.cyan,
                    gradientcolor2: Colors.indigo,
                  ),
                  SizedBox(
                    height: 30,
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
