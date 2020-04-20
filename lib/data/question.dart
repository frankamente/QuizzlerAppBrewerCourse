import 'package:flutter/widgets.dart';

import 'answerOption.dart';

class Question {
  final String text;
  final AnswerOption correctAnswer;

  Question({@required this.text, @required this.correctAnswer});
}
