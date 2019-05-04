import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

// import '../modal/user_model.dart';
import '../modal/gedan.dart';
import '../modal/myFollow.dart';
import '../modal/followedModel.dart';
import 'package:music/modal/user_detail_modal.dart';
import 'package:music/service/http.dart';


class MeInfoProvide with ChangeNotifier{
  UserDetailModal meInfo = null;
  Profile profile = null;
  GedanModel myPlayList = null;
  FollowedModel followMe = null;                      // 关注我的
  MyFollower myFollowered = null;                     // 我关注的

  SharedPreferences pref;

  List<PlaylistAbout> onlyMyPlayList = [];
  List<PlaylistAbout> collectionPlayList = [];

  int uid = 109496832;

  // 保存用户信息
  saveMeInfo(  ) async {
    pref.setString("meInfo", meInfo.toString() );
    notifyListeners();
  }

  // 保存基础信息
  saveNameAndPsw( phoner, psw, time, uid ){
    pref.setString("phone", phoner);
    pref.setString("psw", psw );
    pref.setString("time", time);
    pref.setInt("userId", uid);
    notifyListeners();
  }

  // 从本地获取info
  getMeInfo() async {
    pref = await SharedPreferences.getInstance();
    var info = pref.getString("meInfo");
    uid = pref.getInt("userId");
    meInfo = info == null ? null : UserDetailModal.fromJson( json.decode(info) );
    notifyListeners();
  }

  // 设置个人信息
  setMeinfo( data ){
    
    meInfo = UserDetailModal.fromJson( data );
    profile = meInfo.profile;
    notifyListeners();

  }
  // 我关注的他们
  setMyFollowed( data ){

    myFollowered = MyFollower.fromJson( data );
    notifyListeners();
    
  }

  // 更新用户信息
  updateInfo(){
    int oooouid = pref.getInt("userId");
    requestGet("userDetail", formData: { "uid" : oooouid }).then( ( res ){
      setMeinfo( res );
    });
  }

  // 重置cookie
  reSetCookie(){
    DateTime nowTime = DateTime.now();
    DateTime oldTime = DateTime.parse( pref.getString("time") ).add( Duration( days: 13 ) );
    if( nowTime.isBefore(oldTime) ){
      
    } else {
      pref.remove("De-lovely");
      String phone = pref.getString("phone");
      String psw = pref.getString("psw");
      requestGet("login", formData: { "phone": phone, "password": psw }).then(( res ){
        print("---------更新cookie-----------");
      });
    }
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





