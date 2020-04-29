import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzler/data/answerOption.dart';
import 'package:quizzler/data/question.dart';
import 'package:quizzler/data/questionResponse.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  Map<int, Question> questionMap;
  int currentIndex;
  Question lastQuestion;
  List<bool> history = List();
  @override
  QuestionState get initialState {
    questionMap = getQuestionList().asMap();
    currentIndex = 0;
    return QuestionInitial(nextQuestionText: questionMap[currentIndex].text);
  }

  @override
  Stream<QuestionState> mapEventToState(
    QuestionEvent event,
  ) async* {
    lastQuestion = questionMap[currentIndex];
    currentIndex++;
    if (currentIndex == questionMap.length) {
      currentIndex = 0;
    }
    if (event is YesButtonClicked) {
      yield QuestionLoaded(questionResponse: getQuestionResponse(true));
    }
    if (event is NoButtonClicked) {
      yield QuestionLoaded(questionResponse: getQuestionResponse(false));
    }
  }

  List<Question> getQuestionList() {
    return [
      Question(
        correctAnswer: AnswerOption.yes,
        text: '2 + 2 = 4 ?',
      ),
      Question(
        correctAnswer: AnswerOption.no,
        text: '2 - 2 = 1?',
      ),
      Question(
        correctAnswer: AnswerOption.yes,
        text: 'Is 2 * 2 = 4?',
      ),
    ];
  }

  QuestionResponse getQuestionResponse(bool answer) {
    Question question = questionMap[currentIndex];
    AnswerOption answerOption = answer ? AnswerOption.yes : AnswerOption.no;
    bool lastQuestionWasCorrect = lastQuestion.correctAnswer == answerOption;
    history.add(lastQuestionWasCorrect);
    return QuestionResponse(
        nextQuestionText: question.text,
        lastQuestionWasCorrect: lastQuestionWasCorrect,
        history: history);
  }
}
