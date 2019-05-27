import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';








class OneSimiMv extends StatelessWidget {


  String mvCover;
  OneSimiMv({ this.mvCover });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
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
                Icon( Icons.play_circle_outline, size: ScreenUtil().setSp( 28 ), color: Colors.white, ),
                Text("  播放量", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(30) ), )
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(280),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth( 20 )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "这里是标题", 
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle( fontSize: ScreenUtil().setSp( 36 ), fontWeight: FontWeight.bold ),
                ),
                Text("时间  by  作者", style: TextStyle( color: Colors.grey, fontSize: ScreenUtil().setSp( 28 ) ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}













