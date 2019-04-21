import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:audioplayers/audioplayers.dart';


class BottomBar extends StatelessWidget {

  AudioPlayer audioPlayer = AudioPlayer();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          oneIcon( 0xe69b ),
          oneIcon( 0xe62b ),
          _playmenu(  ),
          oneIcon( 0xe628 ),
          oneIcon( 0xec39 ),
        ],
      ),
    );
  }


  Widget oneIcon( int icon ){
    return IconButton(
      onPressed: (){

      },
      icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }

  Widget _playmenu(){
    return IconButton(
      onPressed: () async {
        int result = await audioPlayer.play("https://www.curtaintan.club/m1.mp3");
        if( result == 1 ){
          print("---------成功播放----");
        }
      },
      icon: Icon( IconData( 0xe629, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }




}









