import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzler/bloc/question_bloc.dart';
import 'package:quizzler/pages/questionView.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);
    return BlocBuilder<QuestionBloc, QuestionState>(
        bloc: questionBloc,
        builder: (context, state) {
          if (state is QuestionInitial) {
            return QuestionView(
              questionText: state.nextQuestionText,
            );
          }
          if (state is QuestionLoaded) {
            return QuestionView(
                questionText: state.questionResponse.nextQuestionText);
          }
        });
  }
}
