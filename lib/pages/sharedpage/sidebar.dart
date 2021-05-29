import 'package:flutter/material.dart';
import 'package:movie/pages/home.dart';
import 'package:movie/pages/test.dart';
import 'package:movie/pages/viewfilm.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: TextButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Home()));
          }, child: Text('الصفحه الرئيسيه',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,),),
        ),
        TextButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Home()));
        }, child: Text('عرض الفلم' ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,) ,textAlign: TextAlign.right,),),
        TextButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Home()));
        }, child: Text('الاعدادات ',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.right, )),
      ],
    );
  }
}
