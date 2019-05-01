import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/provider/play_music.dart';





class ProgressBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provide<PlayMusic>(
      builder: ( context, child, data ){
        return Container(
          height: ScreenUtil().setHeight(90),
          padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(50) ),
          child: Row(
            children: <Widget>[
              Text( data.position != null ? 
                "${ data.position.inMinutes }:${data.position.inSeconds % 60 }" : "00.00" ,
                style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.white70 ), ),
              Expanded(
                child: Slider(
                  value: ( data.duration != null &&
                          data.position != null &&
                          data.position.inMilliseconds > 0
                   ) ? (data.position.inMilliseconds / data.duration.inMilliseconds ) : 0.0 ,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  onChanged: ( val ){
                    Provide.value<PlayMusic>(context).seek( (val * data.duration.inMilliseconds).toInt() );
                  },
                ),
              ),
              Text(  data.duration != null ? 
                "${ (data.duration.inSeconds.ceil() / 60).floor() }:${ data.duration.inSeconds.ceil() % 60 }" : "04.10" ,
                style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.white70 ), ),
            ],
          ),
        );
      },
    );
  }
}










