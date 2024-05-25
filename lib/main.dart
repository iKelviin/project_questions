import 'package:flutter/material.dart';
import 'package:project_questions/result.dart';
import './questionary.dart';

void main() {
  runApp(const QuestionApp());
}

class _QuestionsAppState extends State<QuestionApp> {
  var _questionSelected = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'text': 'What is your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'text': 'What is your favorite animal?',
      'answer': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Snake', 'score': 8},
        {'text': 'Elephant', 'score': 10},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'text': 'What is your favorite instructor?',
      'answer': [
        {'text': 'Noah', 'score': 5},
        {'text': 'Leo', 'score': 3},
        {'text': 'Isis', 'score': 8},
        {'text': 'Sophia', 'score': 10}
      ],
    }
  ];

  void _answer(int score) {
    if (hasQuestionSelected) {
      setState(() {
        _questionSelected++;
        _totalScore += score;
      });
    }
    print(_totalScore);
  }

  void _restartQuestionary() {
    setState(() {
      _questionSelected = 0;
      _totalScore = 0;
    });
  }

  bool get hasQuestionSelected {
    return _questionSelected < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgets = [];
    /*for (var textAnswer in questions[_questionSelected].cast()['answer']) {
      answers.add(Answer(textAnswer, _answer));
    }*/
    /*for (var textAnswer in answers) {
      widgets.add(Answer(textAnswer, _answer));
    }*/

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Questions'),
          ),
          body: hasQuestionSelected
              ? Questionary(
                  questions: _questions,
                  questionSelected: _questionSelected,
                  answer: _answer)
              : Result(_totalScore, _restartQuestionary)),
    );
  }
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuestionsAppState createState() {
    return _QuestionsAppState();
  }
}
