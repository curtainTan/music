import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:music/routers/route.dart';



class OneSimiMv extends StatelessWidget {

  String mvCover, mvTitle, mvUser, videoId;
  int playCount, time, mvId;

  OneSimiMv({
    this.mvCover,
    this.mvTitle,
    this.mvUser,
    this.playCount,
    this.time,
    this.mvId,
    this.videoId });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Routes.router.navigateTo(context, "/mvs/" + mvId.toString() + "/" + videoId , replace: true );
      },
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight( 240 ),
            width: ScreenUtil().setWidth( 400 ),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth( 40 )
            ),
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(20),
              top: ScreenUtil().setHeight(20)
            ),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( 3 ),
              image: DecorationImage(
                image: NetworkImage( mvCover ?? "https://www.curtaintan.club/bg/m2.jpg" ),
                fit: BoxFit.cover
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon( Icons.play_circle_outline, size: ScreenUtil().setSp( 34 ), color: Colors.white, ),
                Text( ( playCount > 10000 ) ? " ${ (playCount / 10000).ceil() }万" : "$playCount",
                style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(30) ), )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(280),
            width: ScreenUtil().setWidth( 500 ),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth( 20 )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mvTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle( fontSize: ScreenUtil().setSp( 36 ), fontWeight: FontWeight.bold ),
                ),
                Text("0${ (time / 60000).floor() }:${ (((time % 60000 ).ceil()) / 1000).ceil() }  by  $mvUser",
                style: TextStyle( color: Colors.grey, fontSize: ScreenUtil().setSp( 28 ) ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}













