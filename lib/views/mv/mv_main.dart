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
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";

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












