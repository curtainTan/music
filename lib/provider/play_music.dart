import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


import '../modal/playList.dart';



class PlayMusic with ChangeNotifier{
  Playlist playlist = null;
  Playlist nowList = null;
  AudioPlayer audioPlayer = new AudioPlayer();


  bool isPlay = false;
  

  setPlayList( list ){

    playlist = list;
    notifyListeners();

  }

  setNowList( list ){

    nowList = list;
    notifyListeners();

  }



}

















