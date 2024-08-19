
import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/HomePage/Home.dart';
import 'package:appgym/Pages/authPages/Register.dart';
import 'package:appgym/Widgets/AppBar.dart';
import 'package:appgym/Widgets/Drawer.dart';
import 'package:appgym/apiAuth/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../apiAuth/UserModel.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late UserModel user;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool checked = false;

  bool erros = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff121111),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(child: Container(width: MediaQuery.of(context).size.width,alignment: Alignment.center,child: Image.asset('assets/images/logo.png'))),
              SizedBox(height: 20,),
              FadeInLeft(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Faça login',style: TextStyle(color: Colors.white,fontFamily: "JetBrains",fontWeight: FontWeight.bold,fontSize: 35),),
                      Text('no TEA',style: TextStyle(color: Colors.yellow,fontFamily: "JetBrains",fontWeight: FontWeight.bold,fontSize: 35),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              FadeInUp(
                duration: Duration(milliseconds: 700),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Color(0xff1e1e1e),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        onChanged: (d){
                          setState(() {
                            erros = false;
                          });
                        },
                        style: TextStyle(color: Color(0xffa1a1a1)),
                        controller: emailController,
                        decoration: InputDecoration(
                          label: Text('Digite seu email',style: TextStyle(fontFamily: "JetBrains"),),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.alternate_email_outlined,color: Colors.yellow,),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextField(
                        onChanged: (d){
                          setState(() {
                            erros = false;
                          });
                        },
                        obscureText: true,
                        style: TextStyle(color: Color(0xffa1a1a1)),
                        controller: passwordController,
                        decoration: InputDecoration(

                          label: Text('sua senha',style: TextStyle(fontFamily: "JetBrains"),),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.yellow,),
                        ),
                      ),
                      !erros ? SizedBox(height: 20,) : SizedBox(height: 0,),
                      erros ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                        child: Text('Credenciais incorretas',style: TextStyle(color: Colors.red,fontFamily: "JetBrains"),),
                      ) : SizedBox(width: 0,height: 0,),
                      ElevatedButton(onPressed: ()async{
                        Future<void> login()async{
                          print("Iniciando Login");
                          setState(() {
                            loading = true;
                          });
                          final res = await AuthService().Login({
                            "email":emailController.text,
                            "password":passwordController.text
                          });

                          if(res != null){
                            print('Retorno de usuario');
                            user = res;
                            setState(() {
                              loading = false;
                              checked = true;
                            });
                            Future.delayed(Duration(milliseconds: 1200),(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user)));
                            });
                          } else{
                            print('Credentials wrong');
                            setState(() {
                              erros = true;
                              loading = false;
                            });
                          }
                        }
                        login();
                      }, child: !loading ? !checked ? Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.black),) : Container(
                          width: 30,height: 30,
                          child: CircleAvatar(child: Icon(Icons.check,color: Colors.white,),backgroundColor: Colors.green,)) : Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(

                        ),
                      ),
                        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        backgroundColor: Colors.yellow,
                        padding: EdgeInsets.symmetric(vertical: 18),
                      ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                      }, child: Text('Não possui uma conta? Cadastre-se'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}