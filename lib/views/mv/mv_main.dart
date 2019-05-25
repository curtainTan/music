import 'dart:async';

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
  GlobalKey myKey = GlobalKey();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";
  
  double boxHeight = 792;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    getMvDetail();
    // Timer( Duration( seconds: 0 ) , (){
    //   getMvDetail();
    // });
    // WidgetsBinding.instance.addPostFrameCallback( (_) => getHeight() );

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
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
      );
      _chewieController.addListener( (){
        if( _chewieController.isFullScreen ){
          print("---------全屏了---------");
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

  Widget aboutBox( context ){
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20)
        ),
        height: ScreenUtil().setHeight(600),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("这里是标题------", maxLines: 2, overflow: TextOverflow.ellipsis, 
                style: TextStyle( fontSize: ScreenUtil().setSp(42), fontWeight: FontWeight.bold ),),
                IconButton(
                  onPressed: (){
                    setState(() {
                      showMore = !showMore;
                    });
                  },
                  icon: Icon( showMore ? Icons.expand_less : Icons.expand_more, size: ScreenUtil().setSp( 60 ), )
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(20)
                  ),
                  child: Text("80万次观看"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: ( context, index ){
                      return Container();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
            ),
            height: ScreenUtil().setHeight( boxHeight ),
            width: double.infinity,
            color: Colors.red,
            child: _mvDetailModal != null ?
              Chewie(
                key: myKey,
                controller: _chewieController,
              ) : Container()
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                
                SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(800),
                    width: double.infinity,
                    color: Colors.red,
                    child: FlatButton(
                      onPressed: () {
                        print("-----------获取元素的信息-----");
                        print("---->>>>>>>>>>----${myKey.currentContext.size}----------");
                        print("---->>>>>>>>>>----${myKey.currentContext.widget.key}----------");
                        print("---->>>>>>>>>>----${myKey.currentContext.size.height}----------");
                        print("---->>>>>>>>>>----${myKey.currentContext.owner}----------");
                        print("---->>>>>>>>>>----${MediaQuery.of(context).padding.top}----------");
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
          )
        ],
      )
    );
  }
}












