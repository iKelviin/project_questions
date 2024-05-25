import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() restartQuestionary;

  const Result(this.score, this.restartQuestionary, {super.key});

  String get textResult {
    if (score < 18) {
      return 'Congratulations!';
    } else if (score < 20) {
      return 'Great!';
    } else if (score < 25) {
      return 'Excellent!';
    } else {
      return 'Unbelievable!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            '$textResult\nScore: $score',
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: restartQuestionary,
            child: const Text(
              'Restart?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ))
      ],
    );
  }
}
