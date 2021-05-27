import 'package:flutter/material.dart';
 import 'package:movie/pages/DepHome/titleRow.dart';
import 'package:movie/pages/sharedpage/nav.dart';
import 'package:movie/pages/sharedpage/sidebar.dart';

class ViewFilm extends StatefulWidget {

  String fimnName;
  ViewFilm(this.fimnName);
  @override
  _ViewFilmState createState() => _ViewFilmState();
}

class _ViewFilmState extends State<ViewFilm> {
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
          Center(child: TitleRow(widget.fimnName)),





        ],
      ),
    );
  }
}
