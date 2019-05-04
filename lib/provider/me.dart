import 'package:flutter/material.dart';


import '../modal/user_model.dart';
import '../modal/gedan.dart';
import '../modal/myFollow.dart';
import '../modal/followedModel.dart';


class MeInfoProvide with ChangeNotifier{
  UserModel meInfo = null;
  Profile profile = null;
  GedanModel myPlayList = null;
  FollowedModel followMe = null;                      // 关注我的
  MyFollower myFollowered = null;                     // 我关注的

  List<PlaylistAbout> onlyMyPlayList = [];
  List<PlaylistAbout> collectionPlayList = [];

  int uid = 109496832;


  // 获取个人信息
  setMeinfo( data ){
    
    meInfo = UserModel.fromJson( data );
    profile = meInfo.profile;
    notifyListeners();

  }
  // 我关注的他们
  setMyFollowed( data ){

    myFollowered = MyFollower.fromJson( data );
    print("----------changdu ---${myFollowered.follow.length}-");
    notifyListeners();
    
  }
  // 关注我的人
  setFollowMe( data ){

    followMe = FollowedModel.fromJson(data);
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





