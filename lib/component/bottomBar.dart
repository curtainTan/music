import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';


import 'package:music/component/myImage.dart';
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
        return data.playlist == null ? Container(
          height: ScreenUtil().setHeight(1),
        ) : GestureDetector(
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
                    // child: Image.network("http://curtaintan.club/headImg/1549358122065.jpg"),
                    // child: Image.network( data.tracks.al.picUrl ),
                    child: MyImage(
                      url: data.tracks?.al?.picUrl ?? "",
                      h: ScreenUtil().setHeight(100),
                      w: ScreenUtil().setHeight(100),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${ data.tracks.name }"),
                      Text("${ data.tracks.ar[0].name }", style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.grey ),)
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    print("点击了一下播放----");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(40) ),
                    height: ScreenUtil().setHeight(150),
                    child: Icon( IconData( data.isPlay ? 0xe629 : 0xe61e , fontFamily: 'iconfont' ), color: Colors.black26, size: ScreenUtil().setSp(65), ),
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(10) ),
                  height: ScreenUtil().setHeight(150),
                  child:  InkWell(
                    onTap: (){
                      
                    },
                    child: Icon(  IconData( 0xe617, fontFamily: 'iconfont' ), color: Colors.black45, size: ScreenUtil().setSp(65), ),
                  )
                ),
              ],
            ),
          )
        );
      },
    );
  }
}













