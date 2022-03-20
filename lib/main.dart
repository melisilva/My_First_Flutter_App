import 'package:flutter/material.dart';

import './quiz.dart';
import './answer.dart';
import './result.dart';

//Default, in Dart each file is its mini library and the things defined in a file are only used in the file
//They can be used in other files however, unless they have a '_' before their name, if so then they are private classes and can only be used in the file in which they are defined

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
//StatelessWidget as the name suggests can't have states
//Why is there widgets that don't have state? They are widgets that are only concerned with outputing data, like Text: it only shows writing and clicking on it doesn't do anything


class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{ //Can be persistent
   final _questions= const[
    {
      'questionText':"What's my favorite color?",
      'answers':[
        {'text':'Purple', 'score':10},
        {'text':'Green','score':0},
        {'text':'Blue','score':5}
      ]
    },
    {
      'questionText': "What's my favorite animal?",
      'answers':[
        {'text':'Platypus','score':5},
        {'text':'Dog','score':10},
        {'text':'Snake','score':0}
      ]
    },
    {
      'questionText': "What's my favorite Green Lantern?",
      'answers':[
        {'text':'Jessica Cruz','score':10},
        {'text':'Guy Gardner','score':0},
        {'text':'Simon Baz','score':5}
      ]
    }

  ];
  var _questionIndex=0;
  var _totalScore=0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore+=score;
    setState(() { //we need to tell flutter we are gonna change the state in order for it to change something
      _questionIndex++;
    });
    print(_questionIndex);
    if(_questionIndex<_questions.length){
      print('We have more questions');
    }
    else{
      print('No more questions');
    }
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


    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App'),
          backgroundColor: Colors.deepPurpleAccent,),
      body: _questionIndex<_questions.length ?
          Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
        : Result(_totalScore,_resetQuiz)));
      //else do this

  }
}

//Normally you should only have one widget per file, unless they are widgets that depend on each other and you don't count on having to use them anywhere else
//const == Compile Time Constant
//final == Run Time Constant