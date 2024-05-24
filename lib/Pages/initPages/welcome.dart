import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/authPages/Login.dart';
import 'package:appgym/Pages/authPages/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Welcome extends StatelessWidget{
  Welcome({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff121111),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInUp(
                    child: Container(
                        child: Image.asset('assets/images/logo.png',width: 250,height: 250,),
                    ),
                  ),
                  SizedBox(height: 60,),
                  FadeInLeft(delay: Duration(milliseconds: 1200),child: Text('Bem-vindo ao TEA!',style: TextStyle(color: Colors.yellow,fontFamily: 'JetBrains',fontSize: 24),textAlign: TextAlign.center,)),
                  SizedBox(height: 9,),
                  FadeInLeft(
                    delay: Duration(milliseconds: 1200),
                    child: Text('O aplicativo TEA foi feito para te auxiliar na nossa unidade, com treinos específicos para cada objetivo e indivíduo',
                      style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains',fontSize: 13),textAlign: TextAlign.center,),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInLeft(
                  child: ElevatedButton(onPressed: ()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                  }, child: Text('Cadastre-se',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.yellow),),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(width: 1,color: Colors.yellow)
                    ),
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.symmetric(vertical: 18,horizontal: 48),
                  ),),
                ),
                SizedBox(width: 8,),
                FadeInRight(
                  child: ElevatedButton(onPressed: ()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  }, child: Text('Entrar',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.black),),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    backgroundColor: Colors.yellow,
                    padding: EdgeInsets.symmetric(vertical: 18,horizontal: 48),
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}