import 'package:flutter/material.dart';

import '../modal/mv/comment_mv.dart';
import '../modal/song/simi_song.dart';


class CommentProvider with ChangeNotifier{

  // 评论类型，为了播放歌曲和返回界面，0代表歌曲，1代表歌单
  int type = 0;
  int id = 0;
  bool haveMore = true;

  // 头部关于评论数据
  String coverImg = "", title = "", userName ="" ;

  SimiSongModal simiSongModal = null;
  MvComment commentModal = null;                          // 当前评论页面的总数据

  List<Comments> commentsList = [];

  // 设置大头数据
  setComment( data ){
    commentModal = MvComment.fromJson( data );
    commentsList = [];
    commentsList..addAll( commentModal.comments );
    if( commentsList.length == commentModal.total ){
      haveMore = false;
    }
    notifyListeners();
  }
  // 初始化基础数据
  initData( { int nowType, int nowId, nowCover, nowName, nowTitle } ){
    type = nowType;
    id = nowId;
    coverImg = nowCover;
    title = nowTitle;
    userName = nowName;
    notifyListeners();
  }
  // 增加评论
  addComment( data ){
    MvComment nowComment = MvComment.fromJson( data );
    commentsList..addAll( nowComment.comments );
    if( commentsList.length == nowComment.total ){
      haveMore = false;
    }
    notifyListeners();
  }
  // 设置相似歌曲
  setSimiSong( data ){
    simiSongModal = SimiSongModal.fromJson( data );
    notifyListeners();
  }


}















