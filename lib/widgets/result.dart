import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final count;
  final total;
  final void Function() onClearState;   //фун., чтоб очищать наши состояния
                                        //именно в таком виде его можно исп. в onPressed: onClearState
  Result({Key? key,
    required this.count,
    required this.total,
    required this.onClearState}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String msg = "";
    Widget img= Image.asset("assets/images/0.jpg");         //в эту перем. можно сохр. виджет (например, изображение)
                                                            //указал конкрет. изоб., потому что ругался, что не мб null
    if(count==0){
      msg = "Нулевой результат";
      img = Image.asset("assets/images/0.jpg");
    }
    else if(count==1){
      msg = "Первый результат";
      img = Image.asset("assets/images/1.png");
    }
    else if(count==2){
      msg = "Второй результат";
      img = Image.asset("assets/images/2.jpeg");
    }
    else if(count==3){
      msg = "Третий результат";
      img = Image.asset("assets/images/3.jpg");
    }
    else if(3 < count && count <= 10){
      msg = "Четвертый результат";
      img = Image.asset("assets/images/4.jpg");
    }


    return Container(

      child: Column(children: [
        Container(
          width: 200, height: 200,     //размер картинки
          child: FittedBox(
            fit: BoxFit.contain,
            child: img,
          ),
        ),

        Container(child: Text(msg, textAlign: TextAlign.center)),

        Divider(color: Colors.white),
        Text("Верно: $count из $total"),
        Divider(color: Colors.white),

       FlatButton(
           child: Text("Пройти ещё раз!", style: TextStyle(fontSize: 18, color: Colors.white),),
           onPressed: onClearState),    //очистит данные (рестарт)


      ],),

      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15.0,
            spreadRadius: 0.0,
            offset: Offset(2.0,5.0)
          )],
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ]
        ),
      ),

    );
  }
}
