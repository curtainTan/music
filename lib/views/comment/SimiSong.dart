import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/play_music.dart';
import 'package:music/provider/commentProvider.dart';
import 'package:music/service/http.dart';


class SimiSongBox extends StatelessWidget {

  BuildContext parent;
  SimiSongBox({ this.parent });

  Widget titleBox(){
    return Container(
      height: ScreenUtil().setHeight( 90 ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("相关推荐", style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), fontWeight: FontWeight.bold ),),
          InkWell(
            onTap: (){
              print("点击了一下");
            },
            child: Container(
              width: ScreenUtil().setWidth( 140 ),
              height: ScreenUtil().setHeight(90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("更多", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ) ), ),
                  Icon( IconData( 0xe65f, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 30 ), )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget oneItem( { coverUrl, id, user, title, album }){
    return GestureDetector(
      onTap: (){
        showDialog(
          context: parent,
          barrierDismissible: true,
          builder: ( context ){
            return AlertDialog(
              title: Text("----小提示----", style: TextStyle( fontWeight: FontWeight.bold ),),
              content: Text("你确定要播放${title}吗？"),
              actions: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("取消", style: TextStyle( color: Colors.white ),),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    requestGet( "checkmusic", formData: { "id" : id } ).then((res1){
                    if( res1['success'] != true ){
                      showDialog(
                        context: context,
                        builder: ( context ){
                          return AlertDialog(
                            title: Text("抱歉,这首歌需要vip才能获取.", style: TextStyle( fontSize: ScreenUtil().setSp(36), color: Colors.red, fontWeight: FontWeight.bold ),),
                            content: Text("请重新选择歌曲播放...", style: TextStyle( fontSize: ScreenUtil().setSp(32) ),),
                          );
                        }
                      );
                    }else{
                      requestGet("songdetail", formData: { "ids" : id } ).then((onValue){
                        Provide.value<PlayMusic>(parent).onlySetTrack( onValue );
                      });
                      requestGet("songurl", formData: { "id" : id } ).then( ( res ){
                        Provide.value<PlayMusic>(parent).setPlayUrl( res['data'][0]['url'] );
                      } );
                      requestGet("lyric", formData: { "id" : id }).then((onValue){
                        Provide.value<PlayMusic>(parent).initLyricModel(onValue);
                      });
                    }
                  });
                  },
                  child: Text("确定", style: TextStyle( color: Colors.white ),),
                )
              ],
            );
          }
        );
      },
      child: Container(
        height: ScreenUtil().setHeight( 150 ),
        width: ScreenUtil().setWidth( 580 ),
        margin: EdgeInsets.only(
          right: ScreenUtil().setWidth( 30 )
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 4 ),
          color: Colors.black12.withOpacity( 0.1 )
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight( 150 ),
              width: ScreenUtil().setHeight( 150 ),
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth( 20 )
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage( coverUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg"),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular( 4 ),
                  topLeft: Radius.circular( 4 ),
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text( title ?? "title", style: TextStyle( fontSize: ScreenUtil().setSp( 34 ) ), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text( "${ user?? "-"} - ${ album ?? "-"}", style: TextStyle( fontSize: ScreenUtil().setSp( 28 ), color: Colors.grey ), )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget loading(){
    return Container(
      alignment: Alignment.topCenter,
      height: ScreenUtil().setHeight( 210 ),
      child: Container(
        margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(100)
        ),
        width: double.infinity,
        height: ScreenUtil().setWidth(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                right: ScreenUtil().setWidth(40)
              ),
              height: ScreenUtil().setWidth(70),
              width: ScreenUtil().setWidth(70),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              )
            ),
            Text("加载中...", style: TextStyle( color: Colors.red ), )
          ], 
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CommentProvider>(
      builder: ( context, child, data ){
        return data.simiSongModal != null ? Container(
          height: ScreenUtil().setHeight( 250 ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth( 30 )
          ),
          child: Column(
            children: <Widget>[
              titleBox(),
              Container(
                height: ScreenUtil().setHeight( 140 ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: ( context, index ){
                    return oneItem(
                      coverUrl: data.simiSongModal.songs[index].album.picUrl,
                      id: data.simiSongModal.songs[index].id,
                      user: data.simiSongModal.songs[index].album.artists[0].name,
                      title: data.simiSongModal.songs[index].name,
                      album: data.simiSongModal.songs[index].album.name
                    );
                  }
                ),
              )
            ],
          ),
        ) : loading();
      },
    );
  }
}








