import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelected;

  Answer(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
          onPressed: onSelected,
          child: Text(texto),
        ));
  }
}
