import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          SizedBox(
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

          Expanded(
            child: Container(
              color: const Color(
                0xff161a1d,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [




                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation:
                                  MaterialStateProperty.all<double>(8.0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () => updateSubtitleUrl(
                                  subtitleLanguage:
                                  ExampleSubtitleLanguage.english,
                                ),
                                child: const Text('Switch to 🇬🇧'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation:
                                  MaterialStateProperty.all<double>(8.0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () => updateSubtitleUrl(
                                  subtitleLanguage:
                                  ExampleSubtitleLanguage.spanish,
                                ),
                                child: const Text('Switch to 🇪🇸'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation:
                                  MaterialStateProperty.all<double>(8.0),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        8.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () => updateSubtitleUrl(
                                  subtitleLanguage:
                                  ExampleSubtitleLanguage.dutch,
                                ),
                                child: const Text('Switch to 🇳🇱'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: TextButton(
        // backgroundColor:Colors.black45,
        onPressed: () { },
        child:Text(':',style: TextStyle(color: Colors.grey,fontSize: 50,fontWeight:FontWeight.bold, ),),
      ),
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
}

enum ExampleSubtitleLanguage {
  english,
  spanish,
  dutch,
}
