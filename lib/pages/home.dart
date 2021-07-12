import 'package:flutter/material.dart';
import 'package:flutter_quiz/models/questions.dart';
import 'package:flutter_quiz/widgets/answer.dart';
import 'package:flutter_quiz/widgets/progress_bar.dart';
import 'package:flutter_quiz/widgets/quiz.dart';
import 'package:flutter_quiz/widgets/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
                                                //этот класс сод. геттер, чер. кот. мы получаем список _data
  final QuestionData data = QuestionData();     //т.е. в data сохранили _data (чер. геттер)
  int _countResult = 0;
  int _questionIndex = 0;

  List<Icon> _icons = [];

  void _clearState() => setState((){   //обнуляем счетчики
    _questionIndex = 0;
    _countResult = 0;
    _icons = [];                 //список для иконок progress bar-а
  });

  void _onChangeAnswer(bool isCorrect) => setState(() {                     //счетчик правил. ответов (ProgressBar)
    if (isCorrect) {
      _icons.add(Icon(Icons.brightness_1, color: Color(0xFFbd27ff)));
      _countResult++;}
    else {
      _icons.add(Icon(Icons.brightness_1, color: Color(0xFF000000)));
    }
    _questionIndex++;
  });

  final whiteTextStyle = TextStyle(color:  Colors.white, fontSize: 20.0);  //сохр. стиль шрифта в переменную


  Widget build(BuildContext context) {
    return Scaffold(             //создает визуальный каркас, обеспечивает UI
      appBar: AppBar(title: Text("Игра"),),

      body: SafeArea(
        child: DefaultTextStyle.merge(
          style: whiteTextStyle,

          child: Container(
            constraints: BoxConstraints.expand(), //макс. расширит
            decoration: BoxDecoration(
              color: const Color(0xff2a375a),
              image: DecorationImage(            //это именно картина для контейнера (фона)
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              )
            ),

            child: Column(
                children: [
                  //передаем: список иконок прогресса (сначала пустой), тек. вопрос (индекс), всего вопросов (длина списка вопросов)
                  ProgressBar(icons: _icons, count: _questionIndex, total: data.questions.length),

                  _questionIndex < data.questions.length
                      ? Quiz(index: _questionIndex, onChangeAnswer: _onChangeAnswer, questionData: data,)  //data-список вопросов, полученный через data
                      : Result(count: _countResult, total: data.questions.length, onClearState: _clearState), //передаем фун., чтобы она там внутри исполнилась
                ],
              ),
          ),
        ),
      )
    );
  }
}