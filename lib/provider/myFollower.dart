import 'package:flutter/material.dart';


import 'package:music/modal/myFollow.dart';


class MyFollowerProvide with ChangeNotifier {


  MyFollower myFollower = null;
  // 关注列表
  setMyFollow( data ){

    myFollower = MyFollower.fromJson( data );
    notifyListeners();
    
  }


}








