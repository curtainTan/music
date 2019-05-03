import 'package:flutter/material.dart';


import 'package:music/modal/user_detail_modal.dart';
import 'package:music/modal/myFollow.dart';
import 'package:music/modal/followedModel.dart';
import 'package:music/modal/gedan.dart';


class UserDataProvide with ChangeNotifier{
  String name = '', headImg = '';                       // 个人中心的name和headimg
  UserDetailModal userdata = null;                      // 用户data
  MyFollower myFollower = null;                         // 关注的人
  FollowedModel followedModel = null;                   // 我关注的人
  GedanModel userPlayList = null;                       // 所有的歌单

  List<PlaylistAbout> onlyMyPlayList = [];              // 自己的歌单
  List<PlaylistAbout> collectionPlayList = [];

  initUserData( cname, cheadImg ){

    name = cname;
    headImg = cheadImg;
    notifyListeners();

  }
  setUserdata( data ){
    userdata = UserDetailModal.fromJson(data);
    notifyListeners();
  }

  setMyFollower( data ){
    myFollower = MyFollower.fromJson(data);
    notifyListeners();
  }

  setFollowedModel( data ){
    followedModel = FollowedModel.fromJson(data);
    notifyListeners();
  }
  
  setUserPlayList( data ){
    userPlayList = GedanModel.fromJson(data);
    List<PlaylistAbout> ss = [];
    List<PlaylistAbout> aa = [];

    userPlayList.playlist.forEach(( item ){
      if( item.userId == userdata.profile.userId ){
        ss..add(item);
      }else{
        aa..add( item );
      }
    });
    onlyMyPlayList = ss;
    collectionPlayList = aa;

    notifyListeners();
  }


}



