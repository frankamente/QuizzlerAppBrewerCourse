import 'package:flutter/widgets.dart';

class QuestionResponse {
  final String nextQuestionText;
  final bool lastQuestionWasCorrect;

  QuestionResponse({
    @required this.nextQuestionText,
    @required this.lastQuestionWasCorrect,
  });
}
