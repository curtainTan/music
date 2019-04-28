import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';



import 'package:music/provider/play_music.dart';
import 'package:music/routers/route.dart';



class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Provide<PlayMusic>(
      builder: ( context, child, data ){
        return GestureDetector(
          onTap: (){
            Routes.router.navigateTo(context, '/playpage' );
          },
          child: Container(
            height: ScreenUtil().setHeight(150),
            width: ScreenUtil().setWidth(1080),
            padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(28) ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity( 0.8 ),
              border: Border(
                top: BorderSide(
                  width: 0.5,
                  color: Colors.black12
                )
              )
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(100),
                  padding: EdgeInsets.only( right: ScreenUtil().setWidth(40) ),
                  child: ClipOval(
                    child: Image.network("http://curtaintan.club/headImg/1549358122065.jpg"),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("歌名"),
                      Text("演唱者", style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.grey ),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(40) ),
                  child: Icon(  IconData( 0xe629, fontFamily: 'iconfont' ), color: Colors.black26, size: ScreenUtil().setSp(65), ),
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(10) ),
                  child: Icon(  IconData( 0xe617, fontFamily: 'iconfont' ), color: Colors.black45, size: ScreenUtil().setSp(65), ),
                ),
              ],
            ),
          )
        );
      },
    );
  }
}













