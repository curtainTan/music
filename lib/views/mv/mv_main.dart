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
import './topAboutBox.dart';
import './oneSimiMv.dart';
import './oneComment.dart';


class MvPage extends StatefulWidget {

  int mvid;
  MvPage( { this.mvid } );

  @override
  _MvPageState createState() => _MvPageState();
}

class _MvPageState extends State<MvPage> {

  MvDetailModal _mvDetailModal = null;
  SimiMvModal _simiMvModal = null;
  MvComment _mvComment = null;

  GlobalKey myKey = GlobalKey();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp8.vod.126.net/cloudmusic/MjQ3NDQ3MjUw/89a6a279dc2acfcd068b45ce72b1f560/533e4183a709699d566180ed0cd9abe9.mp4?wsSecret=631fbe072415240217962ad5b7e0c119&wsTime=1558538796";
  
  double boxHeight = 792;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    getSimiMv();
    getMvComment();
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

  void getMvComment(){
    requestGet( "commentMv", formData: { "id" : widget.mvid } ).then( ( res ){
      setState(() {
        _mvComment = MvComment.fromJson( res );
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

  void changeShowMore(){
    setState(() {
     showMore = !showMore;
    });
  }

  Widget loading(){
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(300)
        ),
        width: double.infinity,
        height: ScreenUtil().setWidth(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth(40)
              ),
              height: ScreenUtil().setWidth(70),
              width: ScreenUtil().setWidth(70),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              )
            ),
            Text("加载中...", style: TextStyle( color: Colors.red ), )
          ], 
        )
      )
    );
  }

  Widget someTitle( String title ){
    return SliverToBoxAdapter(
      child: Container(
        height: ScreenUtil().setHeight( 90 ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(40)
        ),
        alignment: Alignment.centerLeft,
        child: Text( title , style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), fontWeight: FontWeight.bold ),),
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
                TopAboutBox(
                  showMore: showMore, 
                  changeFunc: changeShowMore,
                  mvTitle: _mvDetailModal?.data?.name ?? "-" ,
                  playcount: _mvDetailModal?.data?.playCount ?? 0,
                  pubTime: _mvDetailModal?.data?.publishTime ?? "-",
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverAppBarDelegate(
                    minHeight: ScreenUtil().setHeight(150),
                    maxHeight: ScreenUtil().setHeight(150),
                    child: SingerAbout(
                      mvUser: _mvDetailModal?.data?.artistName ?? "-",
                    )
                  ),
                ),
                someTitle( "相关视频" ),
                _simiMvModal != null ? SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(
                    ( context, index ){
                      return OneSimiMv(
                        mvCover: _simiMvModal.mvs[index].cover,
                        mvTitle: _simiMvModal.mvs[index].name,
                        mvUser: _simiMvModal.mvs[index].artistName,
                        playCount: _simiMvModal.mvs[index].playCount,
                        time: _simiMvModal.mvs[index].duration,
                        mvId: _simiMvModal.mvs[index].id,
                      );
                    },
                    childCount: _simiMvModal.mvs.length
                  ),
                  itemExtent: ScreenUtil().setHeight( 280 ),
                ) : SliverToBoxAdapter(
                  child: Container(
                    height: ScreenUtil().setHeight(200),
                    child: Text("暂无相似视频...."),
                  ),
                ),
                someTitle( "精彩评论" ),
                _mvComment != null ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    ( context, index ){
                      return OneComment(
                        headImg: _mvComment.hotComments[index]?.user?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                        commentContext: _mvComment.hotComments[index]?.content ?? "-",
                        likeCount: _mvComment.hotComments[index]?.likedCount ?? 0,
                        time: _mvComment.hotComments[index]?.time ?? 0,
                        commentId: _mvComment.hotComments[index]?.commentId,
                        userId: _mvComment.hotComments[index]?.user?.userId,
                        userName: _mvComment.hotComments[index]?.user?.nickname ?? "-",
                      );
                    },
                    childCount: _mvComment.hotComments.length
                  ),
                ) : SliverToBoxAdapter(
                  child: loading(),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Divider(
                      height: ScreenUtil().setHeight(100),
                      indent: ScreenUtil().setWidth(40),
                      color: Colors.grey,
                    ),
                  )
                ),
                someTitle( "最新评论" ),
                _mvComment != null ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    ( context, index ){
                      return OneComment(
                        headImg: _mvComment.comments[index]?.user?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                        commentContext: _mvComment.comments[index]?.content ?? "-",
                        likeCount: _mvComment.comments[index]?.likedCount ?? 0,
                        time: _mvComment.comments[index]?.time ?? 0,
                        commentId: _mvComment.comments[index]?.commentId,
                        userId: _mvComment.comments[index]?.user?.userId,
                        userName: _mvComment.comments[index]?.user?.nickname ?? "-",
                      );
                    },
                    childCount: _mvComment.comments.length
                  ),
                ) : SliverToBoxAdapter(
                  child: loading(),
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






