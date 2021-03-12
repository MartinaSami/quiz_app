import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function resetQuestion;
  final int totalscore;
  Result(this.resetQuestion, this.totalscore);

// function 34an a3ml 7aga bl score using if conditions
// string have dynamic value not function

  String get resultPhrase {
    String resulttext;
    if (totalscore >= 90) {
      resulttext = " You are awesome!";
    } else if (totalscore >= 50) {
      resulttext = " Pretty Likable!";
    } else {
      resulttext = " You are so bad!";
    }
    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score is :$totalscore",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: b,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: b,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Restart App",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
            ),
            onPressed: resetQuestion,
          ),
        ],
      ),
    );
  }
}
