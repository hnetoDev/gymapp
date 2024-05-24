
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

import '../apiAuth/UserModel.dart';

class DrawerCustom extends StatelessWidget{
  UserModel user;
  DrawerCustom(this.user,{super.key});
  
  
  


  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    late double padding;
    if(height > 700){
      padding = height/50;
    } else{
      padding = height/60;
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
                    CircleAvatar(radius: 93,backgroundColor: Colors.yellow,),
                    SizedBox(height: height/100,),
                    Text(user.email!,style: TextStyle(color: Color(0xff333333),fontFamily: "JetBrains"),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>editProfile(user)));
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
                    CardDrawer('Pag. inicial', Icons.home_outlined, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(user)));
                    }),
                    CardDrawer('Treinos', Icons.accessibility_rounded, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TreinoInit(user)));
                    }),
                    CardDrawer('Pagamentos', Icons.payments_outlined, () {}),
                    CardDrawer('Configurações', Icons.settings_outlined, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: padding),
                      child: ListTile(
                        onTap: ()async{
                          final res = await SharedServices().Logout();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.yellow.withOpacity(0.3),
                          child: Icon(Icons.exit_to_app,color: Colors.yellow,),
                          radius: 19,
                        ),
                        title: Text('Logout',style: TextStyle(color: Colors.red,fontFamily: "JetBrains",fontSize: 15),),

                      ),
                    )
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
}