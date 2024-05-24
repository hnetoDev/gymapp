 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
  AppBarCustom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context){
    return AppBar(
      iconTheme: IconThemeData(color: Colors.yellow),
      backgroundColor: Color(0xff121111),
      centerTitle: true,
      elevation: 0,
      title: Text('TEA',style: TextStyle(color: Color(0xfffcba03),fontFamily: 'JetBrains'),),
    );
  }
}