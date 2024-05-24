import 'dart:async';

import 'package:flutter/material.dart';

class CardTimer extends StatefulWidget{
  bool completed;
  CardTimer(this.completed,{super.key});

  @override
  State<CardTimer> createState() => _CardTimerState(this.completed);
}

class _CardTimerState extends State<CardTimer> {
  bool completed;
  _CardTimerState(this.completed);



  String time = '0:01';
  bool active = false;




  Future<void> tempo()async{
    int minutes = int.parse(time.substring(0,1));
    int seconds = int.parse(time.substring(2,4));


    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(seconds == 1 && minutes > 0){
        minutes--;
        seconds = 59;
      }
      if(seconds == 0 && minutes == 0){
        setState(() {
          completed = true;
        });
        active = false;
        timer.cancel();
      }
      setState(() {
        if(seconds < 10){
          time = '$minutes:0$seconds';
        } else{
          time = '$minutes:$seconds';
        }
      });
      seconds--;
    });
    if(timer.isActive){
      setState(() {
        active = true;
      });

    }

  }

  @override
  Widget build(BuildContext context){
    return Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:!completed ? !active ? Color(0xff1e1e1e) : Colors.red.withOpacity(0.4) : Colors.green,
        ),
        child:!completed ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Peso sugerido',style: TextStyle(color: !active ? Color(0xffa1a1a1) : Colors.white,fontFamily: "JetBrains"),),
                Text('10 kilos',style: TextStyle(color: !active ? Color(0xffa1a1a1) : Colors.white,fontFamily: "JetBrains"),),
              ],
            ),
            Text(time,style: TextStyle(color: !active ? Color(0xffa1a1a1) : Colors.white,fontFamily: "JetBrains"),),
            ElevatedButton(onPressed:tempo, child: Icon(Icons.play_arrow),style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),)


          ],
        ) : Center(
          child: Icon(Icons.check_circle_outline,color: Colors.white,size: 40,),
        )
      );
    }
}
