part of 'question_bloc.dart';

abstract class QuestionState extends Equatable {}

class QuestionInitial extends QuestionState {
  final String nextQuestionText;

  QuestionInitial({@required this.nextQuestionText});
  @override
  List<Object> get props => [nextQuestionText];
}

class QuestionLoaded extends QuestionState {
  final QuestionResponse questionResponse;

  QuestionLoaded({@required this.questionResponse});
  @override
  List<Object> get props => [questionResponse];
}
