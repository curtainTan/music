import 'package:flutter/material.dart';


import 'package:music/modal/user_model.dart';
import 'package:music/modal/myFollow.dart';
import 'package:music/modal/followedModel.dart';
import 'package:music/modal/gedan.dart';




class UserDataProvide with ChangeNotifier{
  String name = '', headImg = '';
  UserModel userdata = null;
  MyFollower myFollower = null;
  FollowedModel followedModel = null;
  GedanModel userPlayList = null;

  List<PlaylistAbout> onlyMyPlayList = [];
  List<PlaylistAbout> collectionPlayList = [];

  initUserData( cname, cheadImg ){

    name = cname;
    headImg = cheadImg;
    notifyListeners();

  }
  setUserdata( data ){
    userdata = UserModel.fromJson(data);
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








