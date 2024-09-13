import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Question.dart';
import'package:html/html_escape.dart' as htmlParser;

Future<List<Question>> fetchQuestions(String category,String difficulty) async {
  late String apiURL;


  if (category=='Science'){
    if (difficulty=='Easy'){
      apiURL='https://opentdb.com/api.php?amount=20&category=17&difficulty=easy&type=multiple';
    }
    else if (difficulty=='Medium')
      {
        apiURL='https://opentdb.com/api.php?amount=20&category=17&difficulty=medium&type=multiple';
      }
    else {
      apiURL='https://opentdb.com/api.php?amount=20&category=17&difficulty=hard&type=multiple';
    }
    }


  else if(category=='Computer'){
    if (difficulty=='Easy'){
      apiURL='https://opentdb.com/api.php?amount=20&category=18&difficulty=easy&type=multiple';
    }
    else if (difficulty=='Medium')
    {
      apiURL='https://opentdb.com/api.php?amount=20&category=18&difficulty=medium&type=multiple';
    }
    else {
      apiURL='https://opentdb.com/api.php?amount=20&category=18&difficulty=hard&type=multiple';
    }
  }


  else if(category=='Math'){
    if (difficulty=='Easy'){
      apiURL='https://opentdb.com/api.php?amount=20&category=19&difficulty=easy&type=multiple';
    }
    else if (difficulty=='Medium')
    {
      apiURL='https://opentdb.com/api.php?amount=20&category=19&difficulty=medium&type=multiple';
    }
    else {
      apiURL='https://opentdb.com/api.php?amount=20&category=19&difficulty=hard&type=multiple';
    }
  }
  else if(category=='Entertainment'){
    if (difficulty=='Easy'){
      apiURL='https://opentdb.com/api.php?amount=20&category=11&difficulty=easy&type=multiple';
    }
    else if (difficulty=='Medium')
    {
      apiURL='https://opentdb.com/api.php?amount=20&category=11&difficulty=medium&type=multiple';
    }
    else {
      apiURL='https://opentdb.com/api.php?amount=20&category=11&difficulty=hard&type=multiple';
    }
  }


  //start here
  else if(category=='E-gaming'){
    if (difficulty=='Easy'){
      apiURL='https://opentdb.com/api.php?amount=20&category=15&difficulty=easy&type=multiple';
    }
    else if (difficulty=='Medium')
    {
      apiURL='https://opentdb.com/api.php?amount=20&category=15&difficulty=medium&type=multiple';
    }
    else {
      apiURL='https://opentdb.com/api.php?amount=20&category=15&difficulty=hard&type=multiple';
    }
  }

  final response = await http.get(Uri.parse(apiURL));
  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body);
    List<Map<String, dynamic>> results = List<Map<String, dynamic>>.from(jsonBody['results']);
    return results.map((questionMap) {
      List<String> options = List<String>.from(questionMap['incorrect_answers']);
      options.add(questionMap['correct_answer']);
      options.shuffle();


      return Question(
        question: questionMap['question'],
        correctAnswer: questionMap['correct_answer'],
        incorrectAnswers: options,
      );
    }).toList();
  } else {
    throw Exception('Failed to load questions');
  }
}
