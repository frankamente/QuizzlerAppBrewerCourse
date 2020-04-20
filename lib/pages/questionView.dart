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
          Row(
            children: <Widget>[
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
