import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/HomePage/components/SliderTea.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
import 'package:appgym/apiAuth/SharedServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apiAuth/UserModel.dart';

class HomePage extends StatelessWidget{
  UserModel user;

  HomePage(this.user,{super.key});




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff121111),
      appBar: AppBarCustom(),
      drawer:DrawerCustom(user),
      body: ListView(
        padding: EdgeInsets.all(13),
        children: [
          FadeInLeft(
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child:SliderTea(),
            ),
          ),

          FadeInUp(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container( width: MediaQuery.sizeOf(context).width - 10,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Color(0xff1e1e1e),
                    border: Border.all(width: 2,color: Colors.red),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [

                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 10,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Color(0xff1e1e1e),
                    border: Border.all(width: 2,color: Colors.red),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width - 10,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xff1e1e1e),
                  border: Border.all(width: 2,color: Colors.red),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Seu plano vence em:", style: TextStyle(color: Colors.white,fontFamily: 'JetBrains',fontWeight: FontWeight.bold,fontSize: 14 ),),
                    Text("28/10/2024", style: TextStyle(color: Color(0xfffcba03),fontFamily: 'JetBrains',fontWeight: FontWeight.bold,fontSize: 20),),
                  ],
                ),
              ),
              Row(
                children: [],
              )
            ],
          ))
        ],
      )
    );
  }

}