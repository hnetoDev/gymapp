import 'package:animate_do/animate_do.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

import '../../apiAuth/UserModel.dart';

class editProfile extends StatelessWidget{
  UserModel user;
  editProfile(this.user,{super.key});


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emergController = TextEditingController();


  final __formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff121111),
      appBar: AppBarCustom(),
      drawer: DrawerCustom(user),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18,vertical: 10),
          child: Form(
            key: __formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(radius: 60,backgroundColor: Colors.yellow,),
                    Positioned(child: Icon(Icons.image_search,color: Colors.yellow,),bottom: 0,right: 0,)
                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Digite seu Email';
                    }
                    if(!value.endsWith('@gmail.com')){
                      return 'Email incorreto';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text('Email',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),
                    prefixIcon: Icon(Icons.alternate_email_outlined,color: Colors.yellow,),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty || value.length < 6){
                      return 'A senha deve conter no minimo 6 caracteres';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text('Senha',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),

                    prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.yellow,),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Digite seu nome';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text('Nome',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),

                    prefixIcon: Icon(Icons.person,color: Colors.yellow,),
                  ),

                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    return Validador().add(Validar.CPF, msg: 'CPF Inválido')
                        .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                        .minLength(11)
                        .maxLength(11)
                        .valido(value,clearNoNumber: true);
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: cpfController,
                  decoration: InputDecoration(
                    label: Text('Cpf',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),

                    prefixIcon: Icon(Icons.password,color: Colors.yellow,),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty || value.length < 11){

                      return 'O numero está errado';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: telController,
                  decoration: InputDecoration(
                    label: Text('Tel. Contato',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),

                    prefixIcon: Icon(Icons.call,color: Colors.yellow,),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value){
                    if(value == null || value.isEmpty || value.length < 11){
                      return 'O numero está errado';
                    }
                    return null;
                  },
                  style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                  controller: emergController,
                  decoration: InputDecoration(
                    label: Text('Tel. Emergência',style: TextStyle(fontFamily: "JetBrains"),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(width: 1,color: Colors.blue),
                    ),

                    prefixIcon: Icon(Icons.add_call,color: Colors.yellow,),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: ()async{
                  if(__formKey.currentState!.validate()){
                   print('valid');
                  }
                }, child: Text('Concluir',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.black),),style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.yellow,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50)
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}