import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionindex;
  final Function answerQuestions;
  Quiz(this.answerQuestions, this.questionindex, this.questions);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionindex]['questiontext']),
        // key and value in the map
        ...(questions[questionindex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // 34an a3rf a pass value ll function w hia el score
          // using lamda expression
          return Answer(() => answerQuestions(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
