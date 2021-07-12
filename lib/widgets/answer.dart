import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String titleQ;                  //можно и просто title
  final isCorrect;                  //
  final Function onChangeAnswer;    //будем передавать фун. как параметр


  Answer({Key? key,
    required this.titleQ,
    required this.isCorrect,
    required this.onChangeAnswer,
  }) : super(key: key);   //конструктор

  @override
  Widget build(BuildContext context) {
    return GestureDetector(                 //GestureDetector
      onTap: () => onChangeAnswer(isCorrect),      //

      child: Container(
        child: Text(
          titleQ,
          textAlign: TextAlign.center,
        ),

        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(1,1),
          )],
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ])
        ),
      ),
    );
  }
}
