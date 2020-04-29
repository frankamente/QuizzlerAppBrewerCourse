import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzler/bloc/question_bloc.dart';

class QuestionView extends StatelessWidget {
  final String questionText;

  const QuestionView({Key key, @required this.questionText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  this.questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: FlatButton(
              onPressed: () => questionBloc.add(YesButtonClicked()),
              child: SizedBox(
                height: 100.0,
                child: Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: FlatButton(
              onPressed: () => questionBloc.add(NoButtonClicked()),
              child: SizedBox(
                height: 100.0,
                child: Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          History()
        ],
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionBloc = BlocProvider.of<QuestionBloc>(context);
    return BlocBuilder<QuestionBloc, QuestionState>(
        bloc: questionBloc,
        builder: (context, state) {
          if (state is QuestionInitial) {
            return Row(
              children: <Widget>[],
            );
          }
          if (state is QuestionLoaded) {
            List<Icon> history = List();
            state.questionResponse.history.forEach((lastQuestionWasCorrect) {
              history.add(Icon(
                lastQuestionWasCorrect ? Icons.check : Icons.close,
                color: lastQuestionWasCorrect ? Colors.green : Colors.red,
              ));
            });
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: history)),
            );
          }
        });
  }
}
