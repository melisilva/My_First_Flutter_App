import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget{
  final List<Map<String,Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex
});

  @override
  Widget build(BuildContext context){
    return Column(children: [
    Question(questions[questionIndex]['questionText']), //this is how you access a map
    //function(address) we're passing around is known as callback because the receiving widget calls it in the future
    //forwarding the pointer to the function
    ...(questions[questionIndex]['answers'] as List<String>).map((answer){
    return Answer(answerQuestion, answer);
    }).toList()
  ],
    );
  }
}