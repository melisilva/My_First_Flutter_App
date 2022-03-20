import 'package:flutter/material.dart';

//void main() => runApp(MyApp()); Dart uses => when there's only one expression
void main(){
  //Put here the code that kicks off the app because this will always be the first function to be executed
  //On the screen we see a bunch of widgets
  runApp(MyApp()); //normal function written by the flutter team
  //Takes our widget tree and tries to make it a reality

}

//Widget is a special type of object
//Gonna create a class that will be the widget that we see in the app
//We can only extend one class at a time
//StatelessWidget is a class that allows us to create our own widgets
class MyApp extends StatelessWidget{
  var questionIndex=0;
  void answerQuestion(){
    questionIndex++;
  }
  @override //decorator - makes code cleaner and clearer
  Widget build(BuildContext context){
    //home is a core widget
    //MaterialApp -> does a lot of heavy lifting in order to make a widget
    //Scaffold has the job to create a basic design for the page
    //AppBar->actions are buttons
    //Put commas after everything, it's easier for flutter to format stuff correctly like this
    //body can only take one widget
    //items above each other->Column(); items next to each other->Row()
    //Dart has the concept of list

    var questions=[
      'What\s your favorite color?',
      'What\s your favorite animal?'
    ];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App'),),
      body: Column(children: [
        Text(questions[questionIndex]),
       ElevatedButton(
           onPressed: answerQuestion, //to just point to a function instead of executing it, you use the function's name without the parenthesis + also do this when you have functions that don't return anything
           child: Text('Answer 1')
       ), //onPressed:x, x is the function to be activated once you press the button
        ElevatedButton(
            onPressed: () => print('Answer 2 chosen'),
            child: Text('Answer 2')
        ),
        ElevatedButton(
            onPressed: (){
              print('Answer 3 chosen');
            },
            child: Text('Answer 3')
        ),
      ],),
    ),);
  }
}
