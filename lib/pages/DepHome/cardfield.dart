import 'package:flutter/material.dart';
class CardField extends StatelessWidget {
  String imageNAME;

  CardField( this.imageNAME);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width*0.3,
        margin: EdgeInsets.only(right: 10),
        height: 160,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(imageNAME,),

        )


    );

  }
}
