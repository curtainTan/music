import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


import '../modal/playList.dart';



class PlayMusic with ChangeNotifier{
  Playlist playlist = null;
  Tracks tracks = null;


  String playUrl = "";
  AudioPlayer audioPlayer = new AudioPlayer();

  bool isPlay = false;




  setPlayList( list ){

    playlist = list;
    notifyListeners();

  }

  setTrack( Tracks data ){

    tracks = data;
    notifyListeners();

  }

  setPlayUrl( data ){

    playUrl = data;
    audioPlayer.setUrl( playUrl );
    notifyListeners();

  }
  // 重置
  setStop(  ){
    
    audioPlayer.stop();

  }
  // 暂停
  setPause(  ){

    audioPlayer.pause();

  }
  // 恢复播放
  resume(){

    audioPlayer.resume();

  }
  // 跳转
  seek( mm ){

    audioPlayer.seek( Duration( milliseconds: mm ) );

  }



}

















