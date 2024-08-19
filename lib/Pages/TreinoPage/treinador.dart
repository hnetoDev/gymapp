

import 'dart:async';
import 'dart:math';


import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/TreinoPage/Widgets/CardTimer.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../apiAuth/UserModel.dart';

class TreinadorPage extends StatefulWidget{
  UserModel user;

  TreinadorPage(this.user,{super.key});



  @override
  State<TreinadorPage> createState() => _TreinadorPageState();
}

class _TreinadorPageState extends State<TreinadorPage> {


  PageController pageController = PageController();
  ScrollController scrollController = ScrollController();



  int pgCurrent = 0;

  int cardCurrent = 0;


  List<Map<String,dynamic>> treinoDB = [
    {
      'title': 'Supino reto aaaaaaaaa',
      'series': 4,
      'aparelho': 20,
      'img': 'assets/images/img.png',
      'restTime' : '1:40'
    },
    {
      'title': 'Supino Inclinado',
      'series': 4,
      'aparelho': 10,
      'img': 'assets/images/supinoInclinado.jpg',
      'restTime' : '1:40'
    },
    {
      'title': 'Voador',
      'series': 4,
      'aparelho': 1,
      'img': 'assets/images/voador.jpg',
      'restTime' : '1:40'
    },
  ];


  void handleProx(){
    if(pgCurrent == treinoDB.length){
      return;
    }


    pgCurrent++;
    pageController.jumpToPage(pgCurrent);
  }
  
  void handleBack(){
    if(pgCurrent==0){
      return;
    }


    pgCurrent--;
    pageController.jumpToPage(pgCurrent);
  }

  @override
  Widget build(BuildContext context){


    double height = MediaQuery.of(context).size.height;

      return Scaffold(
      backgroundColor: Color(0xff121111),
      appBar: AppBarCustom(),
      drawer: DrawerCustom(widget.user),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(14),
          child: Stack(
            children: [
              PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (index){
                print(index);

              },
              itemCount:treinoDB.length + 1,
              itemBuilder: (context,index){
                bool completed = false;
                cardCurrent = index;
                Map<String,dynamic> data = treinoDB[index];
                String title = data['title'];
                int aparelho = data['aparelho'];
                String img = data['img'];
                return FadeInLeft(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(img),
                                  fit: BoxFit.fill,
                          
                                ),
                              ),
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(width: 4,),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(title,style: TextStyle(color: Colors.yellow,fontFamily: "JetBrains",fontSize: 20,),),
                                    Text('Aparelho: $aparelho ',style: TextStyle(color: Color(0xffa1a1a1),fontFamily: "JetBrains"),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                ElevatedButton(onPressed: (){
                                  setState(() {
                                    completed = true;
                                  });
                                },child: Text('Detalhes',style: TextStyle(color: Colors.yellow,fontFamily: 'JetBrains'),),style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff1e1e1e),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 14,horizontal: 15)
                                ),)
                          
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: height/2,
                          child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context,index){

                           return Container(
                               margin: EdgeInsets.symmetric(vertical: 13),
                               child: CardTimer(completed),
                           );
                          }
                          ),
                        ),
                        Text('Registro:',style: TextStyle(color: Colors.white,fontFamily: "JetBrains",fontSize: 20),),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width:200,
                                child: TextField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    label: Text('Digite sua carga',style: TextStyle(fontFamily: "JetBrains"),),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(FontAwesomeIcons.dumbbell,color: Colors.black,),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                padding:EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff121111)
                                ),
                                child: Column(
                                  children: [
                                    Text('Peso Maximo:',style: TextStyle(color: Color(0xffa1a1a1),fontFamily: "JetBrains"),),
                                    Text('12 kilos',style: TextStyle(color: Colors.yellow,fontFamily: "JetBrains"),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6,),
                        Text('$height',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                );
              }),
              Positioned(bottom:10,left: 0,right: 0,child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed:handleBack, child: Text('Voltar',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.yellow),),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 1,color: Colors.yellow)
                      ),
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 18,horizontal: 48),
                    ),),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: ElevatedButton(onPressed:handleProx, child: Text('Proximo',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.black),),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 18,horizontal:48),
                    ),),
                  ),
                ],
              ))

            ],
          ),
        ),
      ),
    );
  }
}
