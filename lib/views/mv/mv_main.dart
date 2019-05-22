import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';




class MvPage extends StatefulWidget {
  @override
  _MvPageState createState() => _MvPageState();
}

class _MvPageState extends State<MvPage> {

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "https://www.curtaintan.club/1.mp4";

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network( mvurl );
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("视频测试"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(900),
            width: double.infinity,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          FlatButton(
            onPressed: () {
              _chewieController.enterFullScreen();
            },
            child: Text('Fullscreen'),
          ),
        ],
      )
    );
  }
}












