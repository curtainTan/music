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
              // oneIcon( 0xe62b, context ),
              _prevBtn(context),
              _playmenu( data.isPlay, context ),
              // oneIcon( 0xe628, context ),
              _nextBtn(context),
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
        Provide.value<PlayMusic>(context).priresume();
      },
      icon: Icon( IconData( icon, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }

  Widget _nextBtn( context ){
    return IconButton(
      onPressed: (){
        Provide.value<PlayMusic>(context).nextPlay();
      },
      icon: Icon( IconData( 0xe628, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }
  Widget _prevBtn( context ){
    return IconButton(
      onPressed: (){
        Provide.value<PlayMusic>(context).forwardSong();
      },
      icon: Icon( IconData( 0xe62b, fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }



  Widget _playmenu( bool isPlay, context ){
    return IconButton(
      onPressed: () {
        if( isPlay ){
          Provide.value<PlayMusic>(context).setPause();
        } else {
          Provide.value<PlayMusic>(context).priresume();
        }
        

      },
      icon: Icon( IconData( isPlay ? 0xe629 : 0xe61e , fontFamily: 'iconfont' ), color: Colors.white, size: ScreenUtil().setSp(75), ),
    );
  }




}









