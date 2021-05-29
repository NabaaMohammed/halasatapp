import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:movie/data/sw_constants.dart';
import 'package:subtitle_wrapper_package/subtitle_controller.dart';
import 'package:chewie/chewie.dart';

import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_style.dart';
import 'package:video_player/video_player.dart';
class Video extends StatefulWidget {
  const Video({Key key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  final String link = SwConstants.videoUrl;
  final SubtitleController subtitleController = SubtitleController(
    subtitleUrl: SwConstants.enSubtitle,
    subtitleDecoder: SubtitleDecoder.utf8,
  );

  VideoPlayerController get videoPlayerController {
    return VideoPlayerController.network(link);
  }

  ChewieController get chewieController {
    return ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      autoInitialize: true,
      allowFullScreen: true,
    );
  }

  void updateSubtitleUrl({
    ExampleSubtitleLanguage subtitleLanguage,
  }) {
    String subtitleUrl;
    switch (subtitleLanguage) {
      case ExampleSubtitleLanguage.english:
        subtitleUrl = SwConstants.enSubtitle;
        break;
      case ExampleSubtitleLanguage.spanish:
        subtitleUrl = SwConstants.esSubtitle;
        break;
      case ExampleSubtitleLanguage.dutch:
        subtitleUrl = SwConstants.nlSubtitle;
        break;
      default:
    }
    if (subtitleUrl != null) {
      subtitleController.updateSubtitleUrl(
        url: subtitleUrl,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final localChewieController = chewieController;
    int _value = 1;
    return Scaffold(
      body: SizedBox(
              height: 270,
              child: SubTitleWrapper(
                videoPlayerController:
                localChewieController.videoPlayerController,
                subtitleController: subtitleController,
                subtitleStyle: const SubtitleStyle(
                  textColor: Colors.white,
                  hasBorder: true,
                ),

                videoChild: Chewie(
                  controller: localChewieController,
                ),
              ),
            ),


      floatingActionButton: PopupMenuButton(
        // value: _value,
          icon: Icon(Icons.language),
        // onSelected: choiceAction,
       itemBuilder: (BuildContext context) {
    return Constants.choices.map((String choice) {
    return PopupMenuItem<String>(
    value: choice,
    child:   TextButton(
      onPressed:() => choiceAction(choice),
      child:  Text(choice,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
    ),
    );
    }).toList();
    },),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );


  }

  @override
  void dispose() {
    super.dispose();
    if (videoPlayerController != null && chewieController != null) {
      videoPlayerController?.dispose();
      chewieController?.dispose();
    }
  }
  void choiceAction(String choice) {
    if(choice==Constants.english){
      updateSubtitleUrl(
          subtitleLanguage:
          ExampleSubtitleLanguage.english);
      print('I First Item');
    }
    else if(choice==Constants.dutch){
      updateSubtitleUrl(
          subtitleLanguage:
          ExampleSubtitleLanguage.dutch);
      print('I Second Item');
    }
    else if(choice==Constants.spanish){
      updateSubtitleUrl(
          subtitleLanguage:
          ExampleSubtitleLanguage.spanish);
      print('I Third Item');
    }
    else {
      updateSubtitleUrl(
          subtitleLanguage:
          ExampleSubtitleLanguage.english);
    }

  }
}

enum ExampleSubtitleLanguage {
  english,
  spanish,
  dutch,
}
class Constants {
  static const String english = 'english';
  static const String spanish = '  spanish';
  static const String dutch = '  dutch';

  static const List<String> choices = <String>[
    english,
    spanish,
    dutch,
  ];
}

