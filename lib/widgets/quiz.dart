import 'package:flutter/material.dart';
import 'package:flutter_quiz/widgets/answer.dart';

class Quiz extends StatelessWidget {

  final index;
  final questionData;
  final onChangeAnswer;

  Quiz({Key? key, this.index, this.onChangeAnswer, this.questionData }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),        //чер. список data обратились к геттеру questions
          child: Text(                              //т.к. это список, то обращ. по индеку к элем. списка
            questionData.questions[index].title,   //т.к. кажд. элем. по структуре Questions, то и обращ. к .title и .answers,
            ),
        ),


        ...questionData.questions[index].answers.map(
                (value) => Answer(                                            //answers сод. пары ключ-знач. (map); в арг. titelQ передаем знач. по ключу answer
              titleQ: value['answer'],                                    //Answer() оформ. его в контейнер со строкой; (value) - callback; value сохр. в себя знач.
              onChangeAnswer: onChangeAnswer,                //без (), т.к. передаем просто как фун. (это счетчик прав. отвтеов)
              isCorrect: value.containsKey("isCorrect") ? true : false,      //проверяем, есть ли у варианта ключ "isCorrect" для опр. правильного
            )
        ).toList(),                     //toList() - оформ. получ. знач. в виде списка (надо, т.к. у нас неск. ключ. "answer)
                                        //а т.к. это список, то встав. его в Column чер. spread-оп. (...)
      ],

    );
  }
}
