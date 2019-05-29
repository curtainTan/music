import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:music/service/http.dart';
import 'package:music/provider/play_music.dart';

// mv
import 'package:music/modal/mv/mv_detail.dart';
import 'package:music/modal/mv/simi_mv.dart';
import 'package:music/modal/mv/comment_mv.dart';

// video
import 'package:music/modal/video/related_video.dart';
import 'package:music/modal/video/video_detail.dart';
import 'package:music/modal/video/video_url.dart';


import './delegate.dart';
import './singerAbout.dart';
import './topAboutBox.dart';
import './oneSimiMv.dart';
import './oneComment.dart';
import './bottomBox.dart';


class MvPage extends StatefulWidget {

  int mvid;
  String videoId;
  MvPage( { this.mvid, this.videoId } );

  @override
  _MvPageState createState() => _MvPageState();
}

class _MvPageState extends State<MvPage>{
  // mv
  MvDetailModal _mvDetailModal = null;
  SimiMvModal _simiMvModal = null;
  MvComment _mvComment = null;
  // video
  RelatedRideoModal _relatedRideoModal = null;
  VideoDetailModal _videoDetailModal = null;
  VideoUrlModal _videoUrlModal = null;
  // 评论
  List<Comments> commentList = [];
  int  commentPage = 2;

  ScrollController _scrollController = null;

  // GlobalKey myKey = GlobalKey();

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  String mvurl = "http://vodkgeyttp9c.vod.126.net/vodkgeyttp8/xOgr8WSM_2172435062_uhd.mp4?wsSecret=527aaf00b22a90099f225be12bbca9ed&wsTime=1559121255&ext=NnR5gMvHcZNcbCz592mDGUGuDOFN18isir07K1EOfL38igB38O7A%2B6J9Pi%2B5S6BGOc%2BFAbv%2BASpwe1HS%2F4j5mChTSgo1M7XkaFIM6Sjx4y94I6ADz5tbo%2B7t808Ai%2BdNV8Gol4zlA7e1NepmcKdynIjURmTpNay%2Fv7gz0uoh%2FQTOtUpSK2Vi2IUKJFMOgYQ0T4zQZcz9vP2C7RqyZD39Zyiim4%2BPD4Q7Dr3JzRXDju2R2vrJ7OxaqWoq2QuU0gCJ";
  
  double boxHeight = 612;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    if( widget.mvid == 0 ){
      getSimiVideo();
      getVideoDetail();
      Timer( Duration( seconds: 0 ) , (){
        getVideoUrl();
      });
    }else{
      getSimiMv();
      Timer( Duration( seconds: 0 ) , (){
        getMvDetail();
      });
    }
    getMvComment();
    _scrollController = ScrollController();
    _scrollController.addListener( (){
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        addComment();
      }
    } );
  }

  void getSimiMv(){
    requestGet( "simiMv", formData: { "mvid" : widget.mvid } ).then( ( res ){
      setState(() {
        _simiMvModal = SimiMvModal.fromJson( res );
      });
    });
  }

  void getSimiVideo(){
    requestGet( "relatedAllvideo", formData: { "id" : widget.videoId } ).then( ( data ){
      setState(() {
        _relatedRideoModal = RelatedRideoModal.fromJson( data );
      });
    });
  }

  void addComment(){
    if( widget.mvid != 0 ){
      requestGet( "commentMv" , formData: { "id" : widget.mvid, "offset" : commentPage } ).then( ( res ){
        MvComment nowData = MvComment.fromJson( res );
        setState(() {
          commentList..addAll( nowData.comments );
          commentPage ++;
        });
      });
    }else{
      requestGet( "commentVideo" , formData: { "id" : widget.videoId, "offset" : commentPage } ).then( ( res ){
        MvComment nowData = MvComment.fromJson( res );
        setState(() {
          commentList..addAll( nowData.comments );
          commentPage ++;
        });
      });
    }
  }

  void getMvComment(){
    if( widget.mvid != 0 ){
      requestGet( "commentMv" , formData: { "id" : widget.mvid } ).then( ( res ){
        setState(() {
          _mvComment = MvComment.fromJson( res );
          commentList..addAll( _mvComment.comments );
        });
      });
    } else {
      requestGet( "commentVideo", formData: { "id" : widget.videoId } ).then( ( res ){
        setState(() {
          _mvComment = MvComment.fromJson( res );
          commentList..addAll( _mvComment.comments );
        });
      });
    }
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
        aspectRatio: 2 / 1,
        autoPlay: true,
        looping: true,
        placeholder: Container(
          color: Colors.red,
        ),
        overlay: Text("这里是overlay"),
        errorBuilder: ( context, err ){
          print("播放器出错了-----${err.toString()}");
          return Container(
            child: Text("---errorBuilder-----", style: TextStyle( color: Colors.yellow ),),
          );
        }
      );
    });
  }

  void getVideoDetail(){
    requestGet( "videoDetail", formData: { "id" : widget.videoId } ).then((onValue){
      setState(() {
        _videoDetailModal = VideoDetailModal.fromJson( onValue );
      });
    });
  }

  void getVideoUrl(){
    requestGet( "videoUrl", formData: { "id" : widget.videoId } ).then((onValue){
      print("-------url数据----------${onValue.toString()}");
      Provide.value<PlayMusic>(context).setPause();
      setState(() {
        _videoUrlModal = VideoUrlModal.fromJson( onValue );
        _videoPlayerController = VideoPlayerController.network( _videoUrlModal.urls[0].url );
      });
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 2 / 1,
        autoPlay: true,
        looping: true,
        // overlay: Text("这里是overlay"),
        errorBuilder: ( context, err ){
          print("播放器出错了-----${err.toString()}");
          return Container(
            child: Text("---errorBuilder-----", style: TextStyle( color: Colors.yellow ),),
          );
        }
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

  Widget _buildProgressIndicator() {
    return new Container(
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(30)
      ),
      child: new Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setHeight(50),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: new Text('即将加载更多...'))
          ],
        )
      ),
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
            color: Colors.black,
            // child: 
            child: widget.mvid != 0 ? (
              _mvDetailModal != null ?
              Chewie(
                // key: myKey,
                controller: _chewieController,
              ) : Container()
            ) : ( 
              _videoUrlModal != null ?
              Chewie(
                // key: myKey,
                controller: _chewieController,
              ) : Container()
            )
          ),
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                widget.mvid != 0 ?
                TopAboutBox(
                  showMore: showMore,
                  changeFunc: changeShowMore,
                  mvTitle: _mvDetailModal?.data?.name ?? "-" ,
                  playcount: _mvDetailModal?.data?.playCount ?? 0,
                  pubTime: _mvDetailModal?.data?.publishTime ?? "-",
                ) : TopAboutBox(
                  showMore: showMore,
                  changeFunc: changeShowMore,
                  mvTitle: _videoDetailModal?.data?.title ?? "-" ,
                  playcount: _videoDetailModal?.data?.playTime ?? 0,
                  publishTimeInt: _videoDetailModal?.data?.publishTime ?? 0,
                  pubTime: "",
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: MySliverAppBarDelegate(
                    minHeight: ScreenUtil().setHeight(150),
                    maxHeight: ScreenUtil().setHeight(150),
                    child: widget.mvid != 0 ? SingerAbout(
                        mvUser: _mvDetailModal?.data?.artistName ?? "-",
                      ) : SingerAbout(
                        mvUser: _videoDetailModal?.data?.creator?.nickname,
                        headImg: _videoDetailModal?.data?.creator?.avatarUrl,
                      )
                  ),
                ),
                someTitle( "相关视频" ),
                widget.mvid != 0 ? ( _simiMvModal != null ? SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(
                      ( context, index ){
                        return OneSimiMv(
                          mvCover: _simiMvModal.mvs[index].cover,
                          mvTitle: _simiMvModal.mvs[index].name,
                          mvUser: _simiMvModal.mvs[index].artistName,
                          playCount: _simiMvModal.mvs[index].playCount,
                          time: _simiMvModal.mvs[index].duration,
                          mvId: _simiMvModal.mvs[index].id,
                          isReplace: true,
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
                  )) : ( 
                    _relatedRideoModal != null ? SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                        ( context, index ){
                          return OneSimiMv(
                            mvCover: _relatedRideoModal.data[index].coverUrl,
                            mvTitle: _relatedRideoModal.data[index].title,
                            mvUser: _relatedRideoModal.data[index].creator[0].userName,
                            playCount: _relatedRideoModal.data[index].playTime,
                            time: _relatedRideoModal.data[index].durationms,
                            mvId: 0,
                            videoId: _relatedRideoModal.data[index].vid,
                            isReplace: true,
                          );
                        },
                        childCount: _relatedRideoModal.data.length
                      ),
                      itemExtent: ScreenUtil().setHeight( 280 ),
                    ) : SliverToBoxAdapter(
                      child: Container(
                        height: ScreenUtil().setHeight(200),
                        child: Text("暂无相似视频...."),
                      ),
                    )
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
                commentList.length != 0 ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    ( context, index ){
                      if( index + 1 == commentList.length ){
                        return _buildProgressIndicator();
                      }else{
                        return OneComment(
                          headImg: commentList[index]?.user?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                          commentContext: commentList[index]?.content ?? "-",
                          likeCount: commentList[index]?.likedCount ?? 0,
                          time: commentList[index]?.time ?? 0,
                          commentId: commentList[index]?.commentId,
                          userId: commentList[index]?.user?.userId,
                          userName: commentList[index]?.user?.nickname ?? "-",
                        );
                      }
                    },
                    childCount: commentList.length
                  ),
                ) : SliverToBoxAdapter(
                  child: loading(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: ScreenUtil().setHeight(150),
                  )
                ),
              ],
            ),
          )
        ],
      ),
      // bottomSheet: CommentBottomBox(),
    );
  }
}






