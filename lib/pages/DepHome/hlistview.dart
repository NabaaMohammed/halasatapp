import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/DepHome/cardfield.dart';
class HListView extends StatelessWidget {
  HListView(this.numbers,this.namegroup);
  final List<String> namegroup;
  final List<String> numbers;

  @override
  Widget build(BuildContext context) {
    return Container(


      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: numbers.length, itemBuilder: (context, index) {
        return Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.32,
          margin: EdgeInsets.only(left: 10),
          child:  Container(
              child: Column(
                  children:<Widget>[
                    CardField('assets/img/${namegroup[index]}.jpg'),
                    Container(

                      child: Text(numbers[index],
                style: TextStyle(color: Colors.white, fontSize: 20),),
                    ),

           ] ),
          ),
         );
      }
      )
    );
  }
}
