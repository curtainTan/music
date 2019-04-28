import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


import '../modal/playList.dart';



class PlayMusic with ChangeNotifier{
  Playlist playlist = null;
  Tracks tracks = null;

  String playUrl = "";
  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration;
  Duration position;

  StreamSubscription durationSubscription;
  StreamSubscription positionSubscription;


  bool isPlay = false;

  initplayer(){
    audioPlayer.setReleaseMode( ReleaseMode.STOP );
    durationSubscription = audioPlayer.onDurationChanged.listen((onData){
      print("-----------获取的时间是：${onData.toString()}");
    });
  }


  setPlayList( list ){
    playlist = list;
    notifyListeners();
  }

  setTrack( data ){
    tracks = data;
    notifyListeners();
  }

  setPlayUrl( data ) async {
    // playUrl = data;
    audioPlayer.setReleaseMode( ReleaseMode.STOP );

    await audioPlayer.play( data );

    audioPlayer.onPlayerStateChanged.listen( ( status){
      print("---------audio的状态${ status }");
    } );

    
    // positionSubscription = audioPlayer.onAudioPositionChanged.listen((onData){
    //   print("-----------获取的position 是：${onData}");
    // });

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
  // 下一曲
  nextPlay( index ){
    tracks = playlist.tracks[index];
    notifyListeners();
  }



}

















