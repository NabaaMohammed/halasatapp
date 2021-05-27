
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ViewImage extends StatelessWidget {
  String imgPath;

  ViewImage(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 20),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(imgPath,),

        )
    );
  }
}
