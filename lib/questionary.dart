import 'package:flutter/material.dart';
import 'package:project_questions/answer.dart';
import 'package:project_questions/question.dart';

class Questionary extends StatelessWidget {
  final int questionSelected;
  final List<Map<String, Object>> questions;
  final void Function(int) answer;

  Questionary({
    required this.questions,
    required this.questionSelected,
    required this.answer,
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = hasQuestionSelected
        ? questions[questionSelected]['answer'] as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Question(questions[questionSelected]['text'].toString()),
        ...answers.map((resp) {
          return Answer(
            resp['text'] as String,
            () => answer(int.parse(resp['score'].toString())),
          );
        }),
      ],
    );
  }
}
