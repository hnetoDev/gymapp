
import 'dart:io';

import 'package:appgym/Pages/EditProfilePage/EditProfile.dart';
import 'package:appgym/Pages/HomePage/Home.dart';
import 'package:appgym/Pages/TreinoPage/TreinoInit.dart';
import 'package:appgym/Pages/authPages/Login.dart';
import 'package:appgym/Pages/authPages/Register.dart';
import 'package:appgym/Pages/initPages/welcome.dart';
import 'package:appgym/Widgets/WebView.dart';
import 'package:appgym/Widgets/cardDrawer.dart';
import 'package:appgym/apiAuth/AuthService.dart';
import 'package:appgym/apiAuth/SharedServices.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../apiAuth/UserModel.dart';

class DrawerCustom extends StatefulWidget{
  UserModel user;
  DrawerCustom(this.user,{super.key});

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {

  final imagePicker = ImagePicker();
  File? imageFile;

  pick(ImageSource source)async{
    final pickedFile = await imagePicker.pickImage(source: source);
    if(pickedFile != null){
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }



  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    late double padding;
    if(height > 700){
      padding = height/50;
    } else{
      padding = height/65;
    }

    return Drawer(
      backgroundColor: Color(0xff121111),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 7),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(radius: 93,backgroundColor: Colors.yellow,backgroundImage: imageFile != null ? FileImage(imageFile!) : null ,child: GestureDetector(
                      child: Icon(Icons.add_a_photo),onTap: _showOptionsBottom,
                    ),),
                    SizedBox(height: height/100,),
                    Text(widget.user.email!,style: TextStyle(color: Color(0xff333333),fontFamily: "JetBrains"),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>editProfile(widget.user)));
                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_outlined,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text('Editar perfil',style: TextStyle(color: Colors.black,fontFamily: 'JetBrains',fontWeight: FontWeight.bold,fontSize: 14),),
                        ],
                      )
                        ,style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,padding: EdgeInsets.symmetric(
                          vertical: 10
                        )),
                      ),
                    ),
                    SizedBox(height:(height < 700) ? height/80 : height/75,),
                    Column(
                      children: [
                        CardDrawer('Pag. inicial', Icons.home_outlined, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(widget.user)));
                        }),
                        CardDrawer('Treinos', Icons.accessibility_rounded, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TreinoInit(widget.user)));
                        }),
                        CardDrawer('Pagamentos', Icons.payments_outlined, () {}),
                        CardDrawer('Configurações', Icons.settings_outlined, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        }),
                        CardDrawer('Sair', Icons.exit_to_app, ()async {
                          final res = await SharedServices().Logout();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
                        },logout: true,),

                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          Positioned(child: GestureDetector(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView('https://www.instagram.com/treinoentreamigos1/')));},child: Icon(FontAwesomeIcons.instagram,color: Colors.yellow,size: 28,)),bottom: 18,left: 27,),
          Positioned(child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView('https://www.instagram.com/treinoentreamigos1/')));},child: Icon(FontAwesomeIcons.whatsapp,color: Colors.yellow,size: 28,)),bottom: 18,left: 70,),

        ],
      ),
    );
  }

  void _showOptionsBottom(){
    showModalBottomSheet(context: context, builder: (_){
      return Container(
        height: 200,
        decoration: BoxDecoration(
          color: Color(0xff1e1e1e),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  pick(ImageSource.gallery);
                  },
                leading: CircleAvatar(
                backgroundColor: Colors.yellow.withOpacity(0.3),child: Icon(Icons.photo,color: Colors.yellow,),
                radius: 19,
                ),
                title: Text('Adicionar da galeria',style: TextStyle(color: Color(0xff4E4D4D),fontFamily: 'JetBrains'),),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  pick(ImageSource.camera);
                },
                leading: CircleAvatar(
                backgroundColor: Colors.yellow.withOpacity(0.3),child: Icon(Icons.camera_alt,color: Colors.yellow,),
                radius: 19,
                ),
                title: Text('Tirar foto',style: TextStyle(color: Color(0xff4E4D4D),fontFamily: 'JetBrains'),),
              ),
              ListTile(
                onTap: (){
                  Navigator.of(context).pop();
                  setState(() {
                    imageFile = null;
                  });
                },
                leading: CircleAvatar(
                backgroundColor: Colors.red.withOpacity(0.3),child: Icon(CupertinoIcons.trash,color: Colors.red,),
                radius: 19,
                ),
                title: Text('Excluir foto',style: TextStyle(color: Color(0xff4E4D4D),fontFamily: 'JetBrains'),),
              ),


            ],
          ),

        ),
      );
    });
  }
}