import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';



import 'package:music/provider/play_music.dart';



class BottomBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Provide<PlayMusic>(
      builder: ( context, child, data ){
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              oneIcon( 0xe69b, context ),
              oneIcon( 0xe62b, context ),
              _playmenu( data.isPlay, context ),
              oneIcon( 0xe628, context ),
              oneIcon( 0xec39, context ),
            ],
          ),
        );
      },
    );
  }


  Widget oneIcon( int icon, context ){
    return IconButton(
      onPressed: (){
        Provide.value<PlayMusic>(context).resume();
      },
      icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }

  Widget _playmenu( bool isPlay, context ){
    return IconButton(
      onPressed: () {
        // int result = await audioPlayer.play("https://www.curtaintan.club/m1.mp3");
        // if( result == 1 ){
        //   print("---------成功播放----");
        // }
        Provide.value<PlayMusic>(context).setPause();

      },
      icon: Icon( IconData( 0xe629, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }




}









