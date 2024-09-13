class Question {
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });
}

class Quiz {
  String title;
  List<Question> questions;

  Quiz({
    required this.title,
    required this.questions,
  });
}
