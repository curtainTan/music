import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:music/service/http.dart';


import 'package:music/modal/mv/mv_detail.dart';
import 'package:music/modal/mv/simi_mv.dart';
import 'package:music/modal/mv/comment_mv.dart';



class MvPage extends StatefulWidget {

  int mvid;
  MvPage( { this.mvid } );

  @override
  _MvPageState createState() => _MvPageState();
}

class _MvPageState extends State<MvPage> {

  MvDetailModal _mvDetailModal = null;

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";

  @override
  void initState() {
    super.initState();
    print("-----------------------传过来的参数----${ widget.mvid }--");
    getMvDetail();
  }

  getMvDetail(){
    requestGet( "mvDetail", formData: { "mvid" : widget.mvid } ).then((onValue){
      setState(() {
        _mvDetailModal = MvDetailModal.fromJson( onValue );
        _videoPlayerController = VideoPlayerController.network( _mvDetailModal.data.brs.s240 );
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController,
          aspectRatio: 3 / 2,
          autoPlay: true,
          looping: true
        );
      });
    });
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
            child: _mvDetailModal != null ?
            Chewie(
              controller: _chewieController,
            ) : Container()
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












