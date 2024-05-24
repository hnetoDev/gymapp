import 'dart:convert';

import 'package:appgym/Pages/authPages/Login.dart';
import 'package:appgym/Pages/initPages/welcome.dart';
import 'package:appgym/apiAuth/SharedServices.dart';
import 'package:appgym/apiAuth/UserModel.dart';
import 'package:flutter/material.dart';

import 'Pages/HomePage/Home.dart';

Widget _defaultInit = Welcome();

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedServices().isLogged();
  if(_result != null){
    final usuario = await SharedServices().getData();
    UserModel? user = usuario;
    if(user != null){
      _defaultInit = HomePage(user);
    }

  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEA',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfffcba03),background: Color(0xff0f0f0f)),
        useMaterial3: true,
      ),
      home: _defaultInit,
    );
  }
}
