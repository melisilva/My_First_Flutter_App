//Creating a custom widget
import 'package:flutter/material.dart';

class Question extends StatelessWidget{
  final questionText; //final tells dart that this value won't changed after the creation of the class

  Question(this.questionText);

  @override
  Widget build (BuildContext context){
    return Container(
      width: double.infinity, //taking the full width of the container, that takes the full width of the device
      margin: EdgeInsets.all(10), //10 px all around
      child: Text(questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }

  /*Container
  * Margin
  * Border
  * Padding
  * child(=Content)
  */
}