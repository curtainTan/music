import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';


import 'package:music/service/http.dart';
import '../modal/playList.dart';
import 'package:music/modal/lyric.dart';


class PlayMusic with ChangeNotifier{
  Playlist playlist = null;                         // 歌曲列表
  Tracks tracks = null;                             // 一首歌的信息
  int currentIndex = 0;                             // 当前播放歌曲的index
  int playListId = 0;                               // 歌曲列表的id
  LyricModel lyricModel = null;                     // 歌词modal


  List<String> preposition = [                      // 前置空白
    "", "", "" 
  ];
  List<int> preTimes = [0,0,0];                     // 前置空白时间
  String absolute = "纯音乐，请欣赏";

  List<String> lyricList = [];                      // 歌词列表
  List<int> lyricTimes = [];                        // 歌词时间列表
  int nowLyricIndex = 2;                            // 当前歌词的index


  String playUrl = "";                              // 歌曲的url
  AudioPlayer audioPlayer = AudioPlayer();
  SharedPreferences prefs;

  Duration duration;                                // 总时长
  Duration position;                                // 位置

  StreamSubscription durationSubscription;          // 获取歌曲时长的流
  StreamSubscription positionSubscription;          // 获取歌曲播放位置的流
  StreamSubscription playerCompleteSubscription;    // 获取播放完成的流


  bool isPlay = false;

  initplayer() async {
    audioPlayer.setReleaseMode( ReleaseMode.STOP );
    // audioPlayer.stop();
    prefs = await SharedPreferences.getInstance();
    await getListToLocal();
    await getSongData();
    // print("---------------初始化----  ");
    // tracks = playlist.tracks[currentIndex];
    // print("${ tracks.name }----------${ tracks.al.name }");
    // computed();
    // getDuration();
    // getPosition();
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
    currentIndex = prefs.getInt( 'currentIndex' ) ?? -1 ;      // 获取歌曲的在列表中的index
    duration = Duration( milliseconds: prefs.getInt( "duration" ) ?? 0 ); // 获取duration
    // playUrl = prefs.getString("playUrl") ?? "";           // 获取歌曲url，并设置
    playListId = prefs.getInt("playListId") ?? 0 ;        // 获取列表id
    // if( playUrl != "" ){
      if( currentIndex >= 0 ){
        tracks = playlist.tracks[currentIndex];
          requestGet("lyric", formData: { "id" : tracks.id }).then((onValue){
          initLyricModel(onValue);
        });
      }
    //   // audioPlayer.setUrl(playUrl);                                                              // 设置url
    // }
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
  // 只设置单曲信息，不加入循环播放
  onlySetTrack( data ){

    tracks = Tracks.fromJson( data['songs'][1] );

    notifyListeners();
  }

  // 设置url
  setPlayUrl( data ) async {

    playUrl = data;
    isPlay = true;
    audioPlayer.setUrl( data );
    Timer( Duration( milliseconds: 600 ) , (){
      priresume();
    } );
    setSongData();

    notifyListeners();
  }
  // 获取歌曲时长
  getDuration(){
    durationSubscription = audioPlayer.onDurationChanged.listen((onData){
      if( duration != onData ){
        duration = onData;
      }
    });
  }
  // 获取播放进度
  getPosition(){
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((onData){
        position = onData;
        if( nowLyricIndex < lyricTimes.length ){
          if( position.inSeconds > lyricTimes[nowLyricIndex] ){
            nowLyricIndex++;
            // print("----------当前歌词----${lyricList[nowLyricIndex]}------------");
          }
        }
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
  // 播放完成
  computed(){
    playerCompleteSubscription = audioPlayer.onPlayerStateChanged.listen((onData){
      if( onData == AudioPlayerState.COMPLETED ){
        // audioPlayer.release();
        // print("----------------播放完成-----------------");
        position = Duration( seconds: 0 );
        nowLyricIndex = 0;
        nextPlay();
      }
    });
  }
  // 恢复播放
  priresume(){
    if( playUrl.length == 0 ){
      playUrl = prefs.getString("playUrl") ?? "";           // 获取歌曲url，并设置
      // print("--------歌曲url----------$playUrl----");
      audioPlayer.setUrl(playUrl);
      Timer( Duration( milliseconds: 600 ) , (){
        audioPlayer.resume();
      } );
      // audioPlayer.play( playUrl );
    }else{
      audioPlayer.resume();
    }
    getDuration();
    getPosition();
    isPlay = true;
    computed(); 
    notifyListeners();
  }
  // 跳转
  seek( mm ){
    audioPlayer.seek( Duration( milliseconds: mm ) );
    position = Duration( milliseconds: mm );
    if( lyricModel.nolyric == null ){
      for( int i = 0; i < lyricTimes.length; i++ ){
        if( position.inSeconds < lyricTimes[i] ){
          nowLyricIndex = i;
          break;
        }
      }
    }else{
      nowLyricIndex = 2;
    }
    notifyListeners();
  }
  // 下一曲
  nextPlay() async {
    audioPlayer.stop();
    if( ( currentIndex + 1 ) >= playlist.tracks.length ){
      currentIndex = 0;
    }else{
      currentIndex += 1 ;
    }
    tracks = playlist.tracks[ currentIndex ];
    position = Duration( seconds: 0 );
    notifyListeners();
    requestGet( "checkmusic", formData: { "id" : tracks.id } ).then((res1){
      print("------------------请求下一曲${res1.toString()}");
      if( res1['success'] == true ){
        requestGet("songurl", formData: { "id" : tracks.id } ).then( ( res ){
          setPlayUrl( res['data'][0]['url'] );
        });
        requestGet("lyric", formData: { "id" : tracks.id }).then((onValue){
          initLyricModel(onValue);
        });
        } else {
          nextPlay();
      }
    });
  }
  // 上一曲
  forwardSong() async {
    audioPlayer.stop();
    if( ( currentIndex - 1 ) < 0  ){
      currentIndex = playlist.tracks.length - 1 ;
    }else{
      currentIndex -= 1;
    }
    tracks = playlist.tracks[ currentIndex ];
    position = Duration( seconds: 0 );
    notifyListeners();
    requestGet( "checkmusic", formData: { "id" : tracks.id } ).then((res1){
      if( res1['success'] == true ){
        requestGet("songurl", formData: { "id" : tracks.id } ).then( ( res ){
          setPlayUrl( res['data'][0]['url'] );
        });
        requestGet("lyric", formData: { "id" : tracks.id }).then((onValue){
          initLyricModel(onValue);
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
    if( lyricModel.nolyric != null ){                     // 纯音乐处理
      nowLyricIndex = 3;
      lyricList = [];
      lyricTimes = [];
      lyricList..addAll( preposition )..add( absolute );
      lyricTimes..addAll( preTimes );
    }else{
      setLyric( lyricModel.lrc.lyric );
    }
    notifyListeners();
  }

  // 设置歌词列表和歌词时间列表
  setLyric( String data ){
    RegExp exp = RegExp( r"\[(\d{1,}):(\d{1,}).(\d{1,})\](.+)?" );

    List<String> nowlyricList = [];                      // 歌词列表
    List<int> nowlyricTimes = [];                        // 歌词时间列表

    List<String> uuu = data.split("\n");
    uuu.forEach((f){
      Iterable<Match> aaa = exp.allMatches(f);
      for( Match one in aaa ){
        // String sss = one.group(0);
        int m = int.parse(one.group(1));
        int s = int.parse( one.group(2) );
        // int mills = int.parse(one.group(3));
        String tt = one.group(4);
        nowlyricList..add( tt == null ? "" : tt );
        nowlyricTimes..add( m * 60 + s );
        // print("-------${sss}----${m}---${s}----${mics}------${tt}------");
      }
    });
    // nowlyricTimes.forEach( (onely){
    //   print("----------$onely");
    // } );
    nowLyricIndex = 2;
    lyricList = [];
    lyricList..addAll( preposition )..addAll( nowlyricList )..addAll( preposition );
    lyricTimes = [];
    lyricTimes..addAll( preTimes )..addAll( nowlyricTimes )..addAll( preTimes );
    
    notifyListeners();
  }


}



