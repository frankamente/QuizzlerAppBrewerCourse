import 'package:flutter/widgets.dart';

class QuestionResponse {
  final String nextQuestionText;
  final bool lastQuestionWasCorrect;
  final List<bool> history;

  QuestionResponse({
    @required this.nextQuestionText,
    @required this.lastQuestionWasCorrect,
    @required this.history,
  });
}
