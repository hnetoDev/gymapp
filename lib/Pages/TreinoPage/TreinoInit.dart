import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/TreinoPage/treinador.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../apiAuth/UserModel.dart';

class TreinoInit extends StatelessWidget{
  UserModel user;
  TreinoInit(this.user,{super.key});
  late int currentWorkout;

  Widget CardTreino(String title,bool active,bool checked){
    return FadeInLeft(
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff1e1e1e),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(fontFamily: "JetBrains", color:Colors.white , fontWeight:FontWeight.bold),),
                Text(checked ? 'Treino concluido' : active ? 'Treino do dia' : 'Treino pendente',style: TextStyle(fontFamily: "JetBrains", color: !checked ? active ?Color(0xffa1a1a1) : Colors.red.withOpacity(0.6) : Colors.green, fontWeight: active ? FontWeight.bold : null),),
              ],
            ),
            ElevatedButton(onPressed: (){}, child: Icon(Icons.play_arrow,color:Colors.yellow ,),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow.withOpacity(0.3)
            ),)
          ],
        ),
      ),
    );
  }


  Widget TreinoDay(VoidCallback function){
    return FadeInRight(
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/images.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Boa sorte! hoje seu treino será:',style: TextStyle(color: Colors.black,fontFamily: 'JetBrains',),),
                Text('Peito e ombro',style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains',),)
              ],
            ),
            SizedBox(height: 5,),
            ElevatedButton(onPressed: function,child: Text('Iniciar',style: TextStyle(color: Colors.yellow,fontFamily: 'JetBrains'),),style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff1e1e1e),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 14)
            ),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff121111),
      appBar: AppBarCustom(),
      drawer: DrawerCustom(user),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TreinoDay((){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TreinadorPage(user)));
              }),
              SizedBox(height: 20,),
              Text('Treinos: ',style: TextStyle(color: Colors.white,fontFamily: "JetBrains",fontSize: 18),),
              SizedBox(height: 20,),
              CardTreino(
                'Treino A',false,true
              ),
              SizedBox(height: 20,),
              CardTreino(
                'Treino B',true,false
              ),
              SizedBox(height: 20,),
              CardTreino(
                'Treino C',false,false
              ),
              SizedBox(height: 20,),
              CardTreino(
                'Treino D',false,false
              ),
            ],
          ),
        ),
      ),
    );
  }
}