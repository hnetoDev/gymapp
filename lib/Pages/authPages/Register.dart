

import 'package:animate_do/animate_do.dart';
import 'package:appgym/Pages/authPages/Login.dart';
import 'package:appgym/apiAuth/AuthService.dart';
import 'package:appgym/apiAuth/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validadores/Validador.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  PageController controller = PageController();

  final __formKey = GlobalKey<FormState>();

  bool error = false;
  bool registrado = false;
  String? genero = '';
  bool loading = false;
  String? msgError = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController emergController = TextEditingController();
  String btnText = 'Proximo';
  double activePage = 0;
  double height = 320;
















  void handleBack(){
    double page = controller.page!;
    if(page == 0){
      return;
    }
    if(page == 3){
      setState(() {
        btnText = 'Proximo';
      });
    }
    setState(() {
      activePage -= 1;
    });
    controller.jumpToPage((page-1).toInt());
    setState(() {
      height = 320;
    });
  }

  Future<bool?> handleProx()async{
    double page = controller.page!;

    if(page == 2){
      setState(() {
        btnText = 'Registrar-se';
      });
    }
    if(page == 3 && (genero == '' || genero == null)){
      setState(() {
        genero=null;
      });
      return false;
    }
    if(page == 3){
      UserModel user = UserModel.fromJson({
        "name":nameController.text,
        "cpf":cpfController.text,
        "tel":telController.text,
        "emerg":emergController.text,
        "email":emailController.text,
        "password":passwordController.text,
        "genero": genero
      });
      setState(() {
        loading=true;
      });
      int res = await AuthService().Register(user);
      if(res == 201){
        return true;
      }
      if(res == 600){
        setState(() {
          error = true;
          loading = false;
          msgError = 'EMAIL e CPF já registrados';
        });
        return false;
      }
      if(res == 601){
        setState(() {
          error = true;
          loading = false;
          msgError = 'CPF já registrado';
        });
        return false;
      }
      if(res == 602){
        setState(() {
          error = true;
          loading = false;
          msgError = 'EMAIL já registrado';
        });
        return false;
      }


    }

    setState((){
      activePage += 1;
    });
    controller.jumpToPage(activePage.toInt());
  }



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
              FadeInLeft(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Registre-se',style: TextStyle(color: Colors.white,fontFamily: "JetBrains",fontWeight: FontWeight.bold,fontSize: 35),),
                      Text('no TEA',style: TextStyle(color: Colors.yellow,fontFamily: "JetBrains",fontWeight: FontWeight.bold,fontSize: 35),),
                          
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              FadeInUp(
                duration: Duration(milliseconds: 700),
                child: Container(
                  height: height,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Form(
                    key: __formKey,
                    child: Stack(
                      children: [
                        PageView(
                          onPageChanged: (index){
                            setState(() {
                              height = 350;
                            });
                          },
                          physics: NeverScrollableScrollPhysics(),
                          controller: controller,
                          children: [
                            FadeInLeft(
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'Digite seu Email';
                                      }
                                      if(!value.endsWith('@gmail.com')){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'Email incorreto';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      label: Text('Email',style: TextStyle(fontFamily: "JetBrains"),),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.alternate_email_outlined,color: Colors.yellow,),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    validator: (value){
                                      if(value == null || value.isEmpty || value.length < 6){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'A senha deve conter no minimo 6 caracteres';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      label: Text('Senha',style: TextStyle(fontFamily: "JetBrains"),),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.yellow,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FadeInLeft(
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'Digite seu nome';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      label: Text('Nome',style: TextStyle(fontFamily: "JetBrains"),),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.alternate_email_outlined,color: Colors.yellow,),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
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
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.yellow,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FadeInLeft(
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value){
                                      if(value == null || value.isEmpty || value.length < 11){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'O numero está errado';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                                    controller: telController,
                                    decoration: InputDecoration(
                                      label: Text('Tel. Contato',style: TextStyle(fontFamily: "JetBrains"),),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.alternate_email_outlined,color: Colors.yellow,),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    validator: (value){
                                      if(value == null || value.isEmpty || value.length < 11){
                                        setState(() {
                                          height =370;
                                        });
                                        return 'O numero está errado';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Color(0xffa1a1a1),fontFamily: 'JetBrains'),
                                    controller: emergController,
                                    decoration: InputDecoration(
                                      label: Text('Tel. Emergência',style: TextStyle(fontFamily: "JetBrains"),),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.lock_outline_sharp,color: Colors.yellow,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FadeInLeft(
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 16,
                                      left: 10,
                                      right: 10,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    genero='m';
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff121111),
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(width: 2,color: genero == 'm' ? Colors.blueAccent : Color(0xff121111) ),
                                                  ),
                                                  child: Icon(Icons.man,color: Colors.blue,size: 80,),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    genero='f';
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff121111),
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(width: 2,color: genero == 'f' ? Colors.pinkAccent : Color(0xff121111) ),

                                                  ),
                                                  child: Icon(Icons.woman,color: Colors.pink,size: 80,),
                                                ),
                                              ),
                                            ],
                                          ),
                                          genero == null ? Text("Selecione seu genero",style: TextStyle(color: Colors.redAccent,fontFamily: 'JetBrains'),) : SizedBox(height: 0,),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ),

                          ],
                        ),
                        Positioned(child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(backgroundColor: Color(activePage == 0 ? 0xffFFFF00 : 0xff313131).withOpacity(0.5),radius: 5,),
                            SizedBox(width: 9,),
                            CircleAvatar(backgroundColor: Color(activePage == 1 ? 0xffFFFF00 : 0xff313131).withOpacity(0.5),radius: 5,),
                            SizedBox(width: 9,),
                            CircleAvatar(backgroundColor: Color(activePage == 2 ? 0xffFFFF00 : 0xff313131).withOpacity(0.5),radius: 5,),
                            SizedBox(width: 9,),
                            CircleAvatar(backgroundColor: Color(activePage == 3 ? 0xffFFFF00 : 0xff313131).withOpacity(0.5),radius: 5,)
                          ],
                        ),
                          bottom: 120,
                          left: 24,
                          right: 30,
                        ),
                        Positioned(bottom: 45,left: 10,right: 10,child: error ? ElevatedButton(onPressed: (){
                          setState(() {
                            error=false;
                          });
                        }, child: Text('$msgError!, clique aqui para tentar novamente',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.redAccent),)
                        ,style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 1,color: Colors.yellow)
                          ),
                          backgroundColor: Color(0xff121111),
                          padding: EdgeInsets.symmetric(vertical: 14,horizontal: activePage == 3 ? 31 : 48),
                        ),)  : loading ? ElevatedButton(onPressed: (){}, child: CircularProgressIndicator(),style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 1,color: Colors.yellow)
                          ),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 14,horizontal: activePage == 3 ? 31 : 48),
                        ),)   : registrado ? ElevatedButton(onPressed: ()async{

                        }, child: Text('Parebéns, usuario registrado!',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.greenAccent),),style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 1,color: Colors.yellow)
                          ),
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: 18,horizontal: activePage == 3 ? 31 : 48),
                        ),) : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: ()async{
                              handleBack();
                            }, child: Text('Voltar',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.yellow),),style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                side: BorderSide(width: 1,color: Colors.yellow)
                              ),
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 18,horizontal: activePage == 3 ? 31 : 48),
                            ),),
                            SizedBox(width: 8,),
                            ElevatedButton(onPressed: ()async{
                              if(__formKey.currentState!.validate()){
                                bool? register = await handleProx();
                                setState(() {
                                  height=320;

                                });
                                if(register == true){
                                  setState(() {
                                    loading = false;
                                    registrado = true;
                                  });
                                  Future.delayed(Duration(milliseconds: 1500),(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  });

                                }
                              }
                            }, child: Text(btnText,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "JetBrains",color: Colors.black),),style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              backgroundColor: Colors.yellow,
                              padding: EdgeInsets.symmetric(vertical: 18,horizontal: activePage == 3 ? 43 : 48),
                            ),),
                          ],
                        ),),
                        Positioned(bottom: 0,left: 10,right: 10,child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                        }, child: Text('Já possui uma conta? clique aqui'))),
                        error ? Positioned(child: Icon(FontAwesomeIcons.circleExclamation,color: Colors.red,),left: 0,top: 0,) : SizedBox(height: 0,width: 0,)
                      ],
                    ),
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