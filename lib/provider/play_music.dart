import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


import 'package:music/service/http.dart';
import '../modal/playList.dart';
import 'package:music/modal/lyric.dart';


class PlayMusic with ChangeNotifier{
  Playlist playlist = null;                         // 歌曲列表
  Tracks tracks = null;                             // 一首歌的信息
  int currentIndex = 0;                             // 当前播放歌曲的index
  int playListId = 0;                               // 歌曲列表的id
  LyricModel lyricModel = null;                     // 歌词modal



  List<String> lyricList = [];                      // 歌词列表
  List<int> lyricTimes = [];                        // 歌词时间列表
  int nowLyricIndex = 0;                            // 当前歌词的index


  String playUrl = "";                              // 歌曲的url
  AudioPlayer audioPlayer = new AudioPlayer();
  SharedPreferences prefs;

  Duration duration;                                // 总时长
  Duration position;                                // 位置

  StreamSubscription durationSubscription;
  StreamSubscription positionSubscription;
  StreamSubscription playerCompleteSubscription;


  bool isPlay = false;

  initplayer() async {
    audioPlayer.setReleaseMode( ReleaseMode.STOP );
    // await savaPlayIndex();
    prefs = await SharedPreferences.getInstance();
    await getListToLocal();
    await getSongData();
    tracks = playlist.tracks[currentIndex];
    // print("${ tracks.name }----------${ tracks.al.name }");
    computed();
    notifyListeners();
  }
  // 保存歌曲列表
  saveListToLocal(){
    prefs.setString( 'playlist', json.encode(playlist).toString() );
  }
  // 获取歌曲列表
  getListToLocal(){
    var temporary = prefs.getString('playlist');
    playlist = temporary == null ? null : Playlist.fromJson( json.decode( temporary ) );
  }
  // 获取一首歌的信息
  getSongData(){
    currentIndex = prefs.getInt( 'currentIndex' ) == null ? 0 : prefs.getInt( 'currentIndex' ) ;      // 获取歌曲的在列表中的index
    duration = Duration( milliseconds: prefs.getInt( "duration" ) == null ? 0 : prefs.getInt( "duration" )   ); // 获取duration
    playUrl = prefs.getString("playUrl") == null ? "" : prefs.getString("playUrl") ;           // 获取歌曲url，并设置
    playListId = prefs.getInt("playListId") == null ? 0 : prefs.getInt("playListId") ;        // 获取列表id
    if( playUrl != "" ){
      audioPlayer.setUrl(playUrl);                    // 设置url
    }
  }
  // 保存一首歌的信息
  setSongData(){
    prefs.setInt( 'currentIndex', currentIndex );  // 保存歌曲的在列表中的index
    prefs.setString("playUrl", playUrl);           // 保存歌曲url
    prefs.setInt("duration", duration.inMilliseconds ); // 保存歌曲时长
  }
  // 设置列表id
  saveListId(){
    prefs.setInt("playListId", playListId);
  }
  
  // 设置列表
  setPlayList( list, listId ){
    playListId = listId;
    playlist = list;
    saveListId();
    saveListToLocal();
    notifyListeners();
  }
  // 设置单曲信息
  setTrack( index ){
    currentIndex = index;
    tracks = playlist.tracks[index];
    notifyListeners();
  }
  // 设置url
  setPlayUrl( data ) async {

    playUrl = data;
    isPlay = true;
    audioPlayer.setUrl( data );
    priresume();
    setSongData();

    notifyListeners();
  }
  // 获取歌曲时长
  getDuration(){
    durationSubscription = audioPlayer.onDurationChanged.listen((onData){
      
      if( duration != onData ){
        // print("总时长---------------$onData");
        // print("转为秒---------------${ onData.inSeconds }");
        // print("转为秒---------------${ onData.inSeconds.ceil() }");
        duration = onData;
      }
    });
  }
  // 获取播放进度
  getPosition(){
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((onData){
        position = onData;
        notifyListeners();
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
  computed(){
    playerCompleteSubscription = audioPlayer.onPlayerCompletion.listen((onData){
      print("-----onPlayerCompletion------------");
      position = Duration( seconds: 0 );
      nextPlay();
    });
  }
  // 恢复播放
  priresume(){
    audioPlayer.resume();
    isPlay = true;
    getDuration();
    getPosition();
    notifyListeners();
  }
  // 跳转
  seek( mm ){
    audioPlayer.seek( Duration( milliseconds: mm ) );
    position = Duration( milliseconds: mm );
    notifyListeners();
  }
  // 下一曲
  nextPlay() async {
    tracks = playlist.tracks[ ++currentIndex ];
    print("-------当前index-------$currentIndex-----");
    position = Duration( seconds: 0 );
    requestGet( "checkmusic", formData: { "id" : tracks.id } ).then((res1){
      if( res1['success'] == true ){
        requestGet("songurl", formData: { "id" : tracks.id } ).then( ( res ){
          setPlayUrl( res['data'][0]['url'] );
        });
        } else {
          nextPlay();
      }
    });
  }
  // 上一曲
  forwardSong() async {
    tracks = playlist.tracks[ --currentIndex ];
    position = Duration( seconds: 0 );
    requestGet( "checkmusic", formData: { "id" : tracks.id } ).then((res1){
      if( res1['success'] == true ){
        requestGet("songurl", formData: { "id" : tracks.id } ).then( ( res ){
          setPlayUrl( res['data'][0]['url'] );
        });
        } else {
        forwardSong();
      }
      notifyListeners();
    });
  }

  // 初始化歌词modal
  initLyricModel( data ){
    lyricModel = LyricModel.fromJson( data );
    if( lyricModel.nolyric ){
      
    }else{

    }
    notifyListeners();
  }

  // 设置歌词列表和歌词时间列表
  setLyric( data ){




    
    notifyListeners();
  }


}













