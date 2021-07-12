import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {

  final icons;    //иконки прогресса
  final count;    //тек. номер вопроса
  final total;    //всего вопросов

  ProgressBar({Key? key, this.icons, this.count, this.total}) : super(key: key);  //конструктор

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),

      child: Row(                                     //будет строка прогресса
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          FittedBox(
          child: Text("$count - $total"),    //покажет 1-4 (1-ый вопрос из 4)
          fit: BoxFit.contain),

          SizedBox(width: 10),

          ...icons,
      ],),
    );
  }
}
