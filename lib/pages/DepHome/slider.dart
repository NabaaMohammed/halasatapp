import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/pages/DepHome/viewImage.dart';
class Slide extends StatefulWidget {
  const Slide({Key key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slide> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     CarouselSlider(
            items: [
              ViewImage("assets/img/f1.jpg"),
              ViewImage("assets/img/f2.jpg"),
              ViewImage("assets/img/f3.jpg"),
              ViewImage("assets/img/f4.jpg"),
              ViewImage("assets/img/f5.jpg"),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
          ),


    );
  }
}

