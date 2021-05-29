import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:movie/data/sw_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
 class Download extends StatelessWidget {
   Download(this.videourl);

   final Dio dio = Dio();
   bool loading = false;
   double progress = 0;
   String videourl;

   Future<bool> saveVideo(String url, String fileName) async {
     Directory directory;
     try {
       if (Platform.isAndroid) {
         if (await _requestPermission(Permission.storage)) {
           directory = await getExternalStorageDirectory();
           String newPath = "";
           print(directory);
           List<String> paths = directory.path.split("/");
           for (int x = 1; x < paths.length; x++) {
             String folder = paths[x];
             if (folder != "Android") {
               newPath += "/" + folder;
             } else {
               break;
             }
           }
           newPath = newPath + "/Movies";
           directory = Directory(newPath);
         } else {
           return false;
         }
       } else {
         if (await _requestPermission(Permission.photos)) {
           directory = await getTemporaryDirectory();
         } else {
           return false;
         }
       }
       File saveFile = File(directory.path + "/$fileName");
       if (!await directory.exists()) {
         await directory.create(recursive: true);
       }
       if (await directory.exists()) {
         await dio.download(url, saveFile.path,
             onReceiveProgress: (value1, value2) {

                 progress = value1 / value2;

             });
         if (Platform.isIOS) {
           await ImageGallerySaver.saveFile(saveFile.path,
               isReturnPathOfIOS: true);
         }
         return true;
       }
       return false;
     } catch (e) {
       print(e);
       return false;
     }
   }

   Future<bool> _requestPermission(Permission permission) async {
     if (await permission.isGranted) {
       return true;
     } else {
       var result = await permission.request();
       if (result == PermissionStatus.granted) {
         return true;
       }
     }
     return false;
   }

   downloadFile() async {

       loading = true;
       progress = 0;

     bool downloaded = await saveVideo(
         SwConstants.videoUrl,
         "video.mp4");
     if (downloaded) {
       print("File Downloaded");
     } else {
       print("Problem Downloading File");
     }

       loading = false;

   }

   @override
   Widget build(BuildContext context) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Container(
           child: loading
               ? Padding(
             padding: const EdgeInsets.all(8.0),
             child: LinearProgressIndicator(
               minHeight: 10,
               value: progress,
             ),
           )
               : IconButton(
               icon: Padding(
                 padding: const EdgeInsets.only(right: 100),
                 child: Icon(
                   Icons.download_rounded,
                   color: Colors.white,
                   size: 40,
                 ),
               ),
             color: Colors.transparent,
               onPressed: downloadFile,
               ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.announcement_sharp,size: 40),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.wash_sharp,size: 40),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Icon(Icons.hdr_weak,size: 40),
         ),
       ],
     );
   }
 }