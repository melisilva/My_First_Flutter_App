import 'package:flutter/material.dart';

class Answer extends StatelessWidget{
  final VoidCallback handler;//has to be a function or a pointer to a function
  final String answerText;

  Answer(this.handler, this.answerText);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child:Text(answerText),
        onPressed: handler,
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurpleAccent,
          textStyle: TextStyle(
            color: Colors.white
          )
        ),
      ),
    );
  }
}