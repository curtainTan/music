import 'package:flutter/material.dart';


import '../modal/user_model.dart';
import '../modal/gedan.dart';
import '../modal/myFollow.dart';
import '../modal/followedModel.dart';


class MeInfoProvide with ChangeNotifier{
  UserModel meInfo = null;
  Profile profile = null;
  GedanModel myPlayList = null;
  FollowedModel myFollowered = null;
  MyFollower myFollower = null;

  List<PlaylistAbout> onlyMyPlayList = [];
  List<PlaylistAbout> collectionPlayList = [];

  int uid = 109496832;



  // 获取个人信息
  setMeinfo( data ){
    
    meInfo = UserModel.fromJson( data );
    profile = meInfo.profile;
    notifyListeners();

  }
  // 关注列表
  setMyFollowed( data ){

    myFollowered = FollowedModel.fromJson( data );
    notifyListeners();
    
  }
  // 获取歌单
  setPlayList( data ){
    myPlayList = GedanModel.fromJson(data);
    List<PlaylistAbout> ss = [];
    List<PlaylistAbout> aa = [];
    myPlayList.playlist.forEach(( item ){
      if( item.userId == 109496832 ){
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





