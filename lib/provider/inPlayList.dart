import 'package:flutter/material.dart';

import '../modal/playList.dart';


class InPlayList with ChangeNotifier{

  UserPlayList nowUiList = null;
  List<Tracks> tracks = [];

  String headerImg = '';
  String title = '';
  int listId = 0;

  setHeader( img, ctitle, id ){
    headerImg = img;
    title = ctitle;
    listId = id;
    notifyListeners();
  }

  clear(){
    nowUiList = null;
    tracks = [];
    notifyListeners();
  }

  setNow( data ){
    nowUiList = UserPlayList.fromJson( data );
    // print("-----设置tracks");
    tracks = nowUiList.playlist.tracks;
    notifyListeners();

  }


}










