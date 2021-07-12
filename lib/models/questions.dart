import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Question {
  final String title; //строка для самого вопроса
  final List<Map> answers; //это список из словарей

  Question({required this.title, required this.answers});
}

class QuestionData {                    //здесь создали объекты по структуре Question и сохр. в список _data
                                        //получим этот список через геттер (внизу)
  final _data = [
    Question(title: "Первый вопрос", answers: [      //список из словарей
      {"answer": "первый ответ"},               //это один слоарь
      {"answer": "второй ответ"},               //это другой словарь
      {"answer": "третий ответ"},
      {"answer": "четвертый ответ", 'isCorrect': 1}, //правильный ответ
    ]),
    Question(title: "Второй вопрос", answers: [
      {"answer": "2первый ответ"}, //это один слоарь
      {"answer": "второй ответ"}, //это другой словарь
      {"answer": "третий ответ"},
      {"answer": "четвертый ответ", 'isCorrect': 1}, //правильный ответ
    ]),
    Question(title: "Третий вопрос", answers: [
      {"answer": "3первый ответ"}, //это один слоарь
      {"answer": "второй ответ"}, //это другой словарь
      {"answer": "третий ответ"},
      {"answer": "четвертый ответ", 'isCorrect': 1}, //правильный ответ
    ]),
    Question(title: "Четвертый вопрос", answers: [
      {"answer": "4первый ответ"}, //это один слоарь
      {"answer": "второй ответ"}, //это другой словарь
      {"answer": "третий ответ"},
      {"answer": "четвертый ответ", 'isCorrect': 1}, //правильный ответ
    ]),
  ];

  //Будем возвращать _data через геттер; геттеры нужны, чтобы обращаться к приатным переменным (а не напрямую к перем.)
  //Берем список. _data и сохр. в список questions

  List <Question> get questions => [..._data];   // чер. spread-оператор(...) вставили _data в questions
}




