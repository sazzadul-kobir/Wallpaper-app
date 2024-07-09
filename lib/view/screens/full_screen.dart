

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:open_filex/open_filex.dart';

import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';

class FullScreen extends StatelessWidget {
  final String imgurl;
  const FullScreen({super.key, required this.imgurl});



  Future<void> DownloadImage(BuildContext context, String imgUrl) async{
    Dio dio=Dio();
    PermissionStatus status=await Permission.storage.request();


    if(!status.isGranted){

       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please allow stroge permission"),backgroundColor: Colors.redAccent,));

    }else{

      try {

      Directory? dir = await getExternalStorageDirectory();
      String savePath = '${dir!.path}/${DateTime.now()}.jpg';

      await dio.download(
       imgUrl,
        savePath,
      );

      await GallerySaver.saveImage(savePath, albumName: "MyAppDownloads");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download Completed'),backgroundColor: Colors.green,
        action:SnackBarAction(
          label: 'open',
          onPressed: () {
            OpenFilex.open(savePath);

          },
        ),
        ),
      );

      print('Image saved at: $savePath');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download Failed'),backgroundColor: Colors.redAccent,),
      );
      print('Error: $e');
    }

    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Hero(
            tag: imgurl,
            child: Image.network(
            imgurl,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              )),
          Positioned(
            left: 30,
            right: 30,
            bottom:  MediaQuery.of(context).size.height * 0.03,
            child: ElevatedButton(
                onPressed: (){
                  DownloadImage(context,imgurl);
                },
                child: Text("Download"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white
              ),
            ),
          )
        ],
      ),
    );
  }
}
