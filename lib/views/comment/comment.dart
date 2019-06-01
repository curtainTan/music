import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/provider/commentProvider.dart';

import 'package:music/service/http.dart';
import 'package:music/views/mv/oneComment.dart';
import './topAbout.dart';
import './SimiSong.dart';


class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {

  int page = 2;
  ScrollController _scrollController = null;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener( (){
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ){
        addComment();
      }
    } );
    Timer( Duration( seconds: 0 ), getData );
  }

  void getData(){
    int id = Provide.value<CommentProvider>(context).id;
    int type = Provide.value<CommentProvider>(context).type;
    if( type == 0 ){
      requestGet("simiSong", formData: { "id" : id }).then( (onValue){
        Provide.value<CommentProvider>(context).setSimiSong( onValue );
      });
    }
    requestGet( type == 0 ? "commentMusic" : "commentPlaylist", formData: { "id" : id } ).then((onValue){
      Provide.value<CommentProvider>(context).setComment( onValue );
    });
  }

  void addComment(){
    int id = Provide.value<CommentProvider>(context).id;
    int type = Provide.value<CommentProvider>(context).type;
    requestGet( type == 0 ? "commentMusic" : "commentPlaylist", formData: { "id" : id, "page" : page } ).then((onValue){
      Provide.value<CommentProvider>(context).addComment( onValue );
    });
    setState(() {
      page++;
    });
  }

  Widget someTitle( String title ){
    return Container(
      height: ScreenUtil().setHeight( 90 ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(40)
      ),
      alignment: Alignment.centerLeft,
      child: Text( title , style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), fontWeight: FontWeight.bold ),)
    );
  }

  Widget loading(){
    return Container(
      alignment: Alignment.topCenter,
      height: ScreenUtil().setHeight( 210 ),
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(100)
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

  Widget _buildProgressIndicator( bool more ) {
    return Container(
      height: ScreenUtil().setHeight(240),
      margin: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(50)
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            more ? Container(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setHeight(50),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ) : Container(),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
              child: Text( more ? "即将加载更多..." : "已经全部加载....", style: TextStyle( color: Colors.grey ), ))
          ],
        )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Provide<CommentProvider>(
      builder: ( context, child, provideData ){
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            titleSpacing: -ScreenUtil().setWidth( 30 ),
            title: Text("评论(${ provideData?.commentModal?.total ?? 0 })", style: TextStyle( fontSize: ScreenUtil().setSp( 40 ) ),),
          ),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: CommentTopBox(),
              ),
              SliverToBoxAdapter(
                child: provideData.type == 0 ? SimiSongBox() : Container(),
              ),
              SliverToBoxAdapter(
                child: someTitle( "精彩评论" ),
              ),
              provideData.commentModal != null ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return OneComment(
                      commentContext: provideData.commentModal?.hotComments[index]?.content ?? "-",
                      headImg: provideData.commentModal?.hotComments[index]?.user?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                      likeCount: provideData.commentModal?.hotComments[index]?.likedCount ?? 0,
                      time: provideData.commentModal?.hotComments[index]?.time ?? 111110,
                      commentId: provideData.commentModal?.hotComments[index]?.commentId,
                      userId: provideData.commentModal?.hotComments[index]?.user?.userId ?? 109496832,
                      userName: provideData.commentModal?.hotComments[index]?.user?.nickname ?? "-",
                    );
                  },
                  childCount: provideData.commentModal?.hotComments?.length ?? 0,
                ),
              ) : SliverToBoxAdapter( child: loading(), ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtil().setHeight( 120 ),
                ),
              ),
              SliverToBoxAdapter(
                child: someTitle( "最新评论" ),
              ),
              provideData.commentsList.length != 0 ? SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index){
                    return OneComment(
                      commentContext: provideData.commentsList[index]?.content ?? "-",
                      headImg: provideData.commentsList[index]?.user?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                      likeCount: provideData.commentsList[index]?.likedCount ?? 0,
                      time: provideData.commentsList[index]?.time ?? 111110,
                      commentId: provideData.commentsList[index]?.commentId,
                      userId: provideData.commentsList[index]?.user?.userId ?? 109496832,
                      userName: provideData.commentsList[index]?.user?.nickname ?? "-",
                    );
                  },
                  childCount: provideData.commentsList?.length ?? 0,
                ),
              ) : SliverToBoxAdapter( child: loading(), ),
              SliverToBoxAdapter(
                child: provideData.commentModal != null ? _buildProgressIndicator( provideData.haveMore ) : Container(),
              )
            ],
          )
        );
      },
    );
  }
}




