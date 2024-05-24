import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDrawer extends StatelessWidget{
  IconData icon;
  String title;
  VoidCallback onPress;

  CardDrawer(this.title,this.icon,this.onPress,{super.key});


  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    late double padding;
    if(height > 700){
      padding = height/50;
    } else{
      padding = height/60;
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
        title: Text(title,style: TextStyle(color: Color(0xff4E4D4D),fontFamily: "JetBrains",fontSize: 15),),
        trailing: CircleAvatar(
          radius: 19,
          backgroundColor: Color(0xff1c1c1c),
          child: Icon(Icons.arrow_forward_ios_outlined,color: Color(0xff6e6e6e).withOpacity(0.3),),
        ),
      ),
    );
  }
}