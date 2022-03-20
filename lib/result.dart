import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final int resultScore;
  final  VoidCallback restart;

  Result(this.resultScore,this.restart);

  String get resultPhrase{ //getters don't need paranthesis
    var resultText='You did it :)';
    if(resultScore<15){
      resultText="You don't know me at all :(";
    }
    if(resultScore<25 && resultScore>=15){
      resultText="You do know me :)";
    }
    if(resultScore>=25){
      resultText="You know me pretty well...or do I never shut up about myself ;) ?";
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
        Text(
          resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight:FontWeight.bold,
        )
        ,textAlign: TextAlign.center,
      ),
          TextButton(
              onPressed: restart,
              child: Text('Restart'),
              style:TextButton.styleFrom(
                primary: Colors.lightBlueAccent
              ),)

  ])

      );



  }
}