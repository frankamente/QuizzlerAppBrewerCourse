import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzler/bloc/question_bloc.dart';
import 'package:quizzler/pages/questionPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: BlocProvider<QuestionBloc>(
        create: (context) => QuestionBloc(),
        child: Scaffold(
          body: QuestionPage(),
        ),
      ),
    );
  }
}
