import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderTea extends StatelessWidget{
  SliderTea({super.key});
  PageController controller = PageController();


  List<Map<String,dynamic>> lista = [
    {
      "Title":'Primeira academia climatizada da regiâo',
      "img": 'assets/images/1.jpeg'
    },
    {
      "Title":'Equipamentos diversificados e de qualidade',
      "img": 'assets/images/2.jpg'
    },
    {
      "Title":'Centro de treinamento completo',
      "img": 'assets/images/3.png'
    },
  ];


  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
       CarouselSlider.builder(
         options: CarouselOptions(
           autoPlay: true,
           scrollDirection: Axis.horizontal,
           enableInfiniteScroll: true,
           height: 350,
           autoPlayInterval: Duration(seconds: 5),
           viewportFraction: 0.9,

         ) ,
         itemBuilder: (context,index,i){
         Map<String,dynamic> data = lista[index];
         String title = data['Title'];
         String img = data['img'];
         return Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage(img),
                     fit: BoxFit.fill
                   ),
                   borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                 ),
                 width: MediaQuery.of(context).size.width - 10,
                 height: 200,
               ),
               Container(
                 padding:EdgeInsets.symmetric(
                   horizontal: 9
                 ),
                 decoration: BoxDecoration(
                   color: Color(0xff1e1e1e),
                   borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                 ),
                 child:Text(title,style: TextStyle(color: Color(0xfffcba03),fontFamily: "JetBrains",fontSize: 15),),
                 width:MediaQuery.of(context).size.width - 10,
                 height: 60,
                 alignment: Alignment.center,
               ),
             ],
           ),
         );
       },
         itemCount: lista.length,
       )
      ],
    );
  }
}