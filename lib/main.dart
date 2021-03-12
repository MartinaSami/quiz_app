import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';
import 'question.dart';
import 'answer.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;
  int totalscore = 0;
  int num1 = 0, num0 = 0, num2 = 0;

  int questionindex = 0;

  void resetQuestion() {
    setState(() {
      questionindex = 0;
      totalscore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
    });
  }
// when you click on any button you call this function and pass the score to the total score
// using constructor and class
// you pass it to the result

  void answerQuestions(score) {
    if (questionindex == 0)
      num0 = score;
    else if (questionindex == 1)
      num1 = score;
    else if (questionindex == 2) num2 = score;
    totalscore += score;

    setState(() {
      questionindex += 1;
    });
    print("questionindex  = $questionindex");
    print("Total Score  = $totalscore");
    print("num0  = $num0");
    print("num1   = $num1");
    print("num 2  = $num2");
  }

  final List<Map<String, Object>> questions = [
    {
      'questiontext': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 20},
        {'text': 'Gray', 'score': 30},
        {'text': 'Pink', 'score': 40},
      ]
    },
    {
      'questiontext': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'lion', 'score': 10},
        {'text': 'tiger', 'score': 20},
        {'text': 'elephant', 'score': 30},
        {'text': 'dog', 'score': 40},
      ]
    },
    {
      'questiontext': 'what\'s your favorite instructor?',
      'answers': [
        {'text': 'ahmed', 'score': 10},
        {'text': 'ali', 'score': 20},
        {'text': 'islam', 'score': 30},
        {'text': 'osama', 'score': 40},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App", style: TextStyle(color: w)),
          actions: <Widget>[
            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                  print("Switched Theme!");
                  if (isSwitch == true) {
                    b = Colors.white;
                    w = w = Colors.black;
                  } else if (isSwitch == false) {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
            color: w,
            child: questionindex < questions.length
                ? Quiz(answerQuestions, questionindex, questions)
                : Result(resetQuestion, totalscore)),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: w,
          ),
          onPressed: () {
            if (questionindex == 1)
              totalscore -= num0;
            else if (questionindex == 2)
              totalscore -= num1;
            else if (questionindex == 3) totalscore -= num2;

            setState(() {
              // 34an mydesh error ll back
              if (questionindex > 0) {
                questionindex--;
              }
            });
            print("questionindex  = $questionindex");
            print("Total Score  = $totalscore");
            print("num0  = $num0");
            print("num1   = $num1");
            print("num 2  = $num2");
          },
        ),
      ),
    );
  }
}// DONE OF QUIZ APP UDEMY ARABOC COURSE
// DONE OF SECTION 4
