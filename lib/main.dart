import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex=0;

  void _answerQuestion(){
    setState(() { //we need to tell flutter we are gonna change the state in order for it to change something
      _questionIndex++;
    });
    print(_questionIndex);
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
      {
        'questionText':'What\s my favorite color?',
        'answers':['Purple','Red','Blue']
      },
      {
        'questionText': 'What\s my favorite animal?',
        'answers':['Platypus', 'Dog','Cat']
      },
      {
        'questionText': 'What\s my favorite Green Lantern?',
        'answers':['Jessica Cruz','Hal Jordan', 'John Stewart']
      }

    ];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My First App'),),
      body: Column(children: [
        Question(questions[_questionIndex]['questionText']), //this is how you access a map
      //function(address) we're passing around is known as callback because the receiving widget calls it in the future
      //forwarding the pointer to the function
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
          return Answer(_answerQuestion, answer);
        }).toList() //... take a list and they pull all the values in it out and add them to the surrounding list as individual values so we don't add a list to a list but the values of a list to a list
      ],),
    ),);
  }
}

//Normally you should only have one widget per file, unless they are widgets that depend on each other and you don't count on having to use them anywhere else
