import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDrawer extends StatelessWidget{
  IconData icon;
  String title;
  VoidCallback onPress;
  bool? logout;

  CardDrawer(this.title,this.icon,this.onPress,{super.key,this.logout});


  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    late double padding;
    if(height > 800){
      padding = height/50;
    }
    if(height < 800){
      padding = height/90;
    }


    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ),
      child: ListTile(
        onTap: onPress,
        leading: CircleAvatar(
          backgroundColor: Colors.yellow.withOpacity(0.3),
          child: Icon(icon,color: Colors.yellow,),
          radius: 19,
        ),
        title: Text(title,style: TextStyle(color: Color(logout != null ? 0xfff44336 :0xff4E4D4D),fontFamily: "JetBrains",fontSize: 15),),
        trailing: CircleAvatar(
          radius: 19,
          backgroundColor: logout != null ? Colors.red.withOpacity(0.4) : Color(0xff1c1c1c),
          child: Icon(Icons.arrow_forward_ios_outlined,color: Color(logout != null ? 0xfff44336 : 0xff6e6e6e).withOpacity(0.3),),
        ),
      ),
    );
  }
}