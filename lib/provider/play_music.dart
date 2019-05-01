import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../modal/playList.dart';



class PlayMusic with ChangeNotifier{
  Playlist playlist = null;                         // 歌曲列表
  Tracks tracks = null;                             // 一首歌的信息
  int currentIndex = 0;                             // 当前播放歌曲的index
  int playListId = 0;

  String playUrl = "";                              // 歌曲的url
  AudioPlayer audioPlayer = new AudioPlayer();
  SharedPreferences prefs;

  Duration duration;                                // 总时长
  Duration position;                                // 位置

  StreamSubscription durationSubscription;
  StreamSubscription positionSubscription;


  bool isPlay = false;

  initplayer() async {
    audioPlayer.setReleaseMode( ReleaseMode.STOP );
    // await savaPlayIndex();
    prefs = await SharedPreferences.getInstance();
    await getListToLocal();
    await getPlayIndex();
    await getSetUrl();
    await getDurationToLocal();
    // getDuration();
    tracks = playlist.tracks[currentIndex];
    print("${ tracks.name }----------${ tracks.al.name }");
    notifyListeners();
  }
  // 保存歌曲的在列表中的index
  savaPlayIndex(){
    prefs.setInt( 'currentIndex', currentIndex );
  }
  // 获取歌曲的在列表中的index
  getPlayIndex(){
    currentIndex = prefs.getInt( 'currentIndex' );
  }
  // 保存歌曲列表
  saveListToLocal(){
    prefs.setString( 'playlist', json.encode(playlist).toString() );
  }
  // 获取歌曲列表中
  getListToLocal(){
    var temporary = prefs.getString('playlist');
    playlist = temporary == null ? null : Playlist.fromJson( json.decode( temporary ) );
  }
  // 获取歌曲url，并设置
  getSetUrl(){
    playUrl = prefs.getString("playUrl");
    audioPlayer.setUrl(playUrl);
  }
  // 保存歌曲url
  setPreUrl(){
    prefs.setString("playUrl", playUrl);
  }
  // 保存歌曲时长
  saveDuration(){
    prefs.setInt("duration", duration.inMilliseconds );
  }
  // 获取duration
  getDurationToLocal(){
    duration = Duration( milliseconds: prefs.getInt( "duration" ) == null ? 0 : prefs.getInt( "duration" )   );
  }
  // 设置列表
  setPlayList( list, listId ){
    playListId = listId;
    playlist = list;
    saveListToLocal();
    notifyListeners();
  }
  // 设置单曲信息
  setTrack( index ){
    currentIndex = index;
    tracks = playlist.tracks[index];
    savaPlayIndex();
    notifyListeners();
  }
  // 设置url
  setPlayUrl( data ) async {

    playUrl = data;
    isPlay = true;
    audioPlayer.setUrl( data );
    await setPreUrl();
    resume();

    // audioPlayer.onPlayerStateChanged.listen( ( status){
    //   print("---------audio的状态${ status }");
    //   if( status == AudioPlayerState.COMPLETED ){
    //     isPlay = false;
    //   }
    // } );
    // getDuration();
    
    notifyListeners();
  }
  // 获取歌曲时长
  getDuration(){
    durationSubscription = audioPlayer.onDurationChanged.listen((onData){
      
      if( duration != onData ){
        print("总时长---------------$onData");
        print("转为秒---------------${ onData.inSeconds }");
        print("转为秒---------------${ onData.inSeconds.ceil() }");
        duration = onData;
        saveDuration();
      }
    });
  }
  // 获取播放进度
  getPosition(){
  positionSubscription = audioPlayer.onAudioPositionChanged.listen((onData){
      position = onData;
    });
  }
  // 重置
  setStop(  ){
    audioPlayer.stop();
  }
  // 暂停
  setPause(  ){
    audioPlayer.pause();
    isPlay = false;
    notifyListeners();
  }
  // 恢复播放
  resume(){
    audioPlayer.resume();
    isPlay = true;
    getDuration();
    notifyListeners();
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

















