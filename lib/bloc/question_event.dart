part of 'question_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}

class YesButtonClicked extends QuestionEvent {
  @override
  List<Object> get props => [];
}

class NoButtonClicked extends QuestionEvent {
  @override
  List<Object> get props => [];
}
