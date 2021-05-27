import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/DepHome/btnMore.dart';
import 'package:movie/pages/DepHome/cardfield.dart';
import 'package:movie/pages/DepHome/hlistview.dart';
import 'package:movie/pages/DepHome/titleRow.dart';
import 'package:movie/pages/sharedpage/nav.dart';
import 'package:movie/pages/sharedpage/sidebar.dart';
import 'package:movie/pages/DepHome/slider.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Sidebar(),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Nav(),
        // backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(right: 12,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnMore(),
                TitleRow('المسلسلات الاعلى مشاهدة'),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
            child: Slide(),
          ),
          Container(
            padding: EdgeInsets.only(right: 12,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnMore(),
                TitleRow('المسلسلات المميزة  '),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.25,
            child:HListView( ['مجهول', 'المصلحه', 'الشايب', 'the call', 'bad boy'],['8','33','22','a','bad'])

          ),
          // CardField("assets/img/f1.jpg" ),
          Container(
            padding: EdgeInsets.only(right: 12,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnMore(),
                TitleRow('الافلام الفائزه بالاوسكار 2021    '),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.25,
              child:HListView( ['joker', 'المجهول', 'الموصل', 'emily', 'twilight'],['joker','66','25','p','t'])

          ),

        ],
      ),
    );
  }
}
