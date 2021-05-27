import 'package:flutter/material.dart';
class TitleRow extends StatelessWidget {
  String titleSection;

  TitleRow(this.titleSection);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
         child: Text(titleSection,style: TextStyle(
          color: Colors.white,
          fontFamily: 'cairo',
          fontSize: 14,
          letterSpacing: 3.0,
          fontWeight: FontWeight.bold,),textAlign: TextAlign.right,),

        );

  }
}
