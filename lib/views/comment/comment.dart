import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/provider/commentProvider.dart';

import 'package:music/service/http.dart';
import 'package:music/views/mv/oneComment.dart';
import './topAbout.dart';



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
      requestGet( "commentMusic", formData: { "id" : id } ).then((onValue){
        Provide.value<CommentProvider>(context).setComment( onValue );
      });
      requestGet("simiSong", formData: { "id" : id }).then( (onValue){
        Provide.value<CommentProvider>(context).setSimiSong( onValue );
      });
    } else {
      requestGet( "commentMusic", formData: { "id" : id } ).then((onValue){
        Provide.value<CommentProvider>(context).setComment( onValue );
      });
    }
  }

  void addComment(){
    int id = Provide.value<CommentProvider>(context).id;
    requestGet( "commentMusic", formData: { "id" : id, "page" : page } ).then((onValue){
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


  @override
  Widget build(BuildContext context) {
    return Provide<CommentProvider>(
      builder: ( context, child, provideData ){
        return Scaffold(
          appBar: AppBar(
            title: Text("评论(${ provideData.count })"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30)
            ),
            child: Column(
              children: <Widget>[
                CommentTopBox(),
                provideData.type == 0 ? Container() : Container(),
                someTitle( "精彩评论" ),
                provideData.commentModal == null ? Expanded(
                  child: ListView.builder(
                    itemBuilder: ( context, index ){
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
                    itemCount: provideData.commentModal.hotComments.length,
                  ),
                ) : loading(),
                someTitle( "最新评论" ),
                provideData.commentsList.length == 0 ? Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemBuilder: ( context, index ){
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
                    itemCount: provideData.commentsList.length,
                  ),
                ) : loading(),
              ],
            )
          ),
        );
      },
    );
  }
}




