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



import './delegate.dart';
import './singerAbout.dart';



class MvPage extends StatefulWidget {

  int mvid;
  MvPage( { this.mvid } );

  @override
  _MvPageState createState() => _MvPageState();
}

class _MvPageState extends State<MvPage> {

  MvDetailModal _mvDetailModal = null;
  SimiMvModal _simiMvModal = null;

  GlobalKey myKey = GlobalKey();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";
  
  double boxHeight = 792;
  bool showMore = false;

  List<String> label = [ "MV", "流行", "音乐", "Showtime" ];

  @override
  void initState() {
    super.initState();
    // getMvDetail();
    Timer( Duration( seconds: 0 ) , (){
      getMvDetail();
    });

  }

  void getSimiMv(){
    requestGet( "simiMv", formData: { "mvid" : widget.mvid } ).then( ( res ){
      setState(() {
        _simiMvModal = SimiMvModal.fromJson( res );
      });
    });
  }

  

  void getMvDetail(){
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
          horizontal: ScreenUtil().setWidth(40)
        ),
        height: ScreenUtil().setHeight(300),
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
            Container(
              height: ScreenUtil().setHeight( 80 ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      right: ScreenUtil().setWidth(20)
                    ),
                    child: Text("80万次观看"),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: ( context, index ){
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth( 38 ),
                            // vertical: ScreenUtil().setHeight( 16 )
                          ),
                          margin: EdgeInsets.only( 
                            right: ScreenUtil().setWidth(18)
                           ),
                          decoration: BoxDecoration(
                            color: Colors.black12.withOpacity( 0.2 ),
                            borderRadius: BorderRadius.circular( 20 )
                          ),
                          child: Text( label[index], style: TextStyle( fontSize: ScreenUtil().setSp( 34 ) ), ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text("2017-1-11 发布", style: TextStyle( fontSize: ScreenUtil().setSp( 38 ) ),),
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
                aboutBox( context ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverAppBarDelegate(
                    minHeight: ScreenUtil().setHeight(150),
                    maxHeight: ScreenUtil().setHeight(150),
                    child: SingerAbout()
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(800),
                    width: double.infinity,
                    color: Colors.cyan,
                  ),
                ),
                _simiMvModal != null ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    ( context, index ){
                      
                    },
                    childCount: 5
                  ),
                ) : SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(200),
                    child: Text("暂无相似视频...."),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(800),
                    width: double.infinity,
                    color: Colors.green,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(800),
                    width: double.infinity,
                    color: Colors.deepOrangeAccent,
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












