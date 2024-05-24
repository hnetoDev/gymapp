import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/HomePage/SliderTea.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
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
      drawer: DrawerCustom(user),
      body: ListView(
        padding: EdgeInsets.all(13),
        children: [
          FadeInLeft(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child:SliderTea(),
            ),
          ),
        ],
      )
    );
  }
}