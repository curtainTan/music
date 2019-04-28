import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:provide/provide.dart';


import './contentBox.dart';
import './progress_bar.dart';
import './bottomBar.dart';
import 'package:music/provider/play_music.dart';


class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Provide<PlayMusic>(
        builder: ( context, child, data ){
          return Stack(
            children: <Widget>[
              Image.network(
                // "https://www.curtaintan.club/bg/m2.jpg",
                data.tracks.al.picUrl,
                width: ScreenUtil().setWidth(1080),
                height: ScreenUtil().setHeight(1920),
                fit: BoxFit.cover,
              ),
              BackdropFilter(
                filter: ImageFilter.blur( sigmaX: 30, sigmaY: 30 ),
                child: Container(
                  color: Colors.grey.withOpacity(0.3),
                  width: ScreenUtil().setWidth(1080),
                  height: ScreenUtil().setHeight(1920),
                  child: Column(
                    children: <Widget>[
                      _head( data.tracks.name, data.tracks.ar[0].name, data.tracks.ar[0].id ),
                      ContentBox(),
                      ProgressBar(),
                      Expanded(
                        child: BottomBar(),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }


  Widget _head( title, name, singerId ){
    return AppBar(
      elevation: 0,
      titleSpacing: -ScreenUtil().setWidth( 20 ),
      backgroundColor: Colors.transparent,
      title: InkWell(
        onTap: (){
          print("点了一下");
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text( title , style: TextStyle( fontSize: ScreenUtil().setSp( 40 ) ),),
              Text("$name >", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.grey ),)
            ],
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon( IconData( 0xe606, fontFamily: 'iconfont' ) ),
        )
      ],
    );
  } 




}









