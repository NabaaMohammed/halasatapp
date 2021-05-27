import 'package:flutter/material.dart';
class BtnMore extends StatelessWidget {
  String titleSection;

  BtnMore();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      child: Text('    المزيد ',style: TextStyle(
        color: Colors.white,
        fontFamily: 'cairo',
        fontSize: 14,
        letterSpacing: 3.0,
        fontWeight: FontWeight.bold,),textAlign: TextAlign.right,),

    );

  }
}
