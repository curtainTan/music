import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/play_music.dart';
import 'package:music/provider/commentProvider.dart';

import 'package:music/service/http.dart';


class CommentTopBox extends StatelessWidget {

  BuildContext parent;
  CommentTopBox({ this.parent });
  
  @override
  Widget build(BuildContext context) {
    return Provide<CommentProvider>(
      builder: ( context, child, data ){
        return InkWell(
          onTap: (){
            if( data.type == 0 ){
              int songId = Provide.value<PlayMusic>(context).tracks.id;
              if( songId != data.id ){
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: ( context ){
                    return AlertDialog(
                      title: Text("----小提示----", style: TextStyle( fontWeight: FontWeight.bold ),),
                      content: Text("你确定要播放${data.title}吗？"),
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
                            requestGet( "checkmusic", formData: { "id" : data.id } ).then((res1){
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
                              requestGet("songdetail", formData: { "ids" : data.id } ).then((onValue){
                                Provide.value<PlayMusic>(parent).onlySetTrack( onValue );
                              });
                              requestGet("songurl", formData: { "id" : data.id } ).then( ( res ){
                                Provide.value<PlayMusic>(parent).setPlayUrl( res['data'][0]['url'] );
                              } );
                              requestGet("lyric", formData: { "id" : data.id }).then((onValue){
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
              } else {
                Navigator.pop(context);
              }
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            height: ScreenUtil().setHeight(280),
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(30)
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: ScreenUtil().setWidth(1)
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    right: ScreenUtil().setWidth(30)
                  ),
                  height: ScreenUtil().setHeight( 200 ),
                  width: ScreenUtil().setHeight( 200 ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage( data.coverImg ),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular( 6 )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text( data.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: ScreenUtil().setSp( 42 ) ), ),
                      Text( "by ${data.userName}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: ScreenUtil().setSp( 32 ) ), )
                    ],
                  ),
                ),
                Icon( IconData( 0xe62d, fontFamily: "iconfont" ), size: ScreenUtil().setSp( 32 ), )
              ],
            ),
          ),
        );
      },
    );
  }
}



