import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:music/service/http.dart';
import 'package:music/provider/play_music.dart';

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

  GlobalKey _myKey = GlobalKey();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";
  bool isOverlay = true;

  @override
  void initState() {
    super.initState();
    getMvDetail();
  }

  getMvDetail(){
    requestGet( "mvDetail", formData: { "mvid" : widget.mvid } ).then((onValue){
      Provide.value<PlayMusic>(context).setPause();
      setState(() {
        _mvDetailModal = MvDetailModal.fromJson( onValue );
        _videoPlayerController = VideoPlayerController.network( _mvDetailModal.data.brs.s240 );
      });
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        // aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        overlay: isOverlay ? Container(
          child: Text("----这里是overlay----", style: TextStyle( color: Colors.white ),),
        ) : Container(
          child: Text("----000000000000000000----", style: TextStyle( color: Colors.white ),),
        )
      );
      _chewieController.addListener( (){
        if( _chewieController.isFullScreen ){
          print("---------全屏了---------");
          setState(() {
            isOverlay = false; 
          });
        }
      } );
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 0,
            expandedHeight: ScreenUtil().setHeight(900),
            flexibleSpace: _mvDetailModal != null ?
              Chewie(
                key: _myKey,
                controller: _chewieController,
              ) : Container()
          ),
          SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(800),
              width: double.infinity,
              color: Colors.red,
              child: FlatButton(
                onPressed: () {
                  print("-----------获取元素的信息-----");
                  print("---->>>>>>>>>>----${_myKey.currentContext.size}----------");
                  print("---->>>>>>>>>>----${_myKey.currentContext.widget.key}----------");
                  print("---->>>>>>>>>>----${_myKey.currentContext.size.height}----------");
                  print("---->>>>>>>>>>----${_myKey.currentContext.owner}----------");
                },
                child: Text('Fullscreen'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(800),
              width: double.infinity,
              color: Colors.cyan,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(800),
              width: double.infinity,
              color: Colors.green,
            ),
          )
        ],
      ),
      // body: NestedScrollView(

      // ),
      // Stack(
      //   children: <Widget>[
      //     SingleChildScrollView(
      //       child: Column(
      //         children: <Widget>[
      //           SizedBox(
      //             height: ScreenUtil().setHeight(400),
      //           ),
      //           Text("data-----"),
      //           FlatButton(
      //             onPressed: () {
      //               _chewieController.enterFullScreen();
      //             },
      //             child: Text('Fullscreen'),
      //           ),
      //         ],
      //       )
      //     ),
      //     Container(
      //       height: ScreenUtil().setHeight(400),
      //       child: _mvDetailModal != null ?
      //         Chewie(
      //           controller: _chewieController,
      //         ) : Container()
      //     ),
      //   ],
      // )
    );
  }
}












