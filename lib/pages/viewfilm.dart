import 'package:flutter/material.dart';
import 'package:movie/data/sw_constants.dart';
import 'package:movie/pages/DepViewItem/download.dart';
 import 'package:movie/pages/DepHome/titleRow.dart';
import 'package:movie/pages/sharedpage/nav.dart';
import 'package:movie/pages/sharedpage/sidebar.dart';
import 'package:video_player/video_player.dart';

import 'DepHome/btnMore.dart';
import 'DepHome/hlistview.dart';
import 'DepViewItem/video.dart';
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
          Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Video()),
          Container(
             height: 50,
              width: MediaQuery.of(context).size.width,
              child: Download(SwConstants.videoUrl)),
          Center(child: TitleRow(widget.fimnName + ':أسم الفلم  ')),
          Container(
            padding: EdgeInsets.only(right: 12,top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BtnMore(),
                TitleRow('فلام مشابهه '),
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
