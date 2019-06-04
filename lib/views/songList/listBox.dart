import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../routers/route.dart';
import 'package:music/provider/inPlayList.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/play_music.dart';
import 'package:music/service/http.dart';

import 'package:music/commonFunc/bottomModal.dart';


class ListBox extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return Provide<InPlayList>(
      builder: ( context, child, data ){
        if( data.tracks.length == 0 ){
          return SliverToBoxAdapter(
            child: Center(
              child: Text("加载中----"),
            ),
          );
        }else{
          return SliverFixedExtentList(
            itemExtent: ScreenUtil().setHeight(170),
            delegate: SliverChildBuilderDelegate(
              ( context, index ){
                return oneItem( 
                  index, 
                  context, 
                  data.tracks[index].name, 
                  data.tracks[index].ar[0].name, 
                  data.tracks[index].id, 
                  data.nowUiList.playlist.id
                );
              },
              childCount: data.tracks.length
            ),
          );
        }
      },
    );
  }


  Widget oneItem( int index, context, String songname, String auth, int id, int playListId ){
    return InkWell(
      onTap: () {
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
            requestGet("songurl", formData: { "id" : id } ).then( ( res ){

            if( playListId != Provide.value<PlayMusic>(context).playListId ){
              var playList =  Provide.value<InPlayList>(context).nowUiList.playlist;
              Provide.value<PlayMusic>(context).setPlayList(playList, playListId);
            }
            Provide.value<PlayMusic>(context).setTrack( index );
            Provide.value<PlayMusic>(context).setPlayUrl( res['data'][0]['url'] );

            } );
            requestGet("lyric", formData: { "id" : id }).then((onValue){
              Provide.value<PlayMusic>(context).initLyricModel(onValue);
            });
          }
        });
      },
      onDoubleTap: (){
        Routes.router.navigateTo(context, Routes.playpage);
      },
      child: Container(
        height: ScreenUtil().setHeight(170),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(100),
              child: Text( "${ index + 1 }", style: TextStyle( fontSize: ScreenUtil().setSp( 50 ), color: Colors.grey ), ),
            ),
            aboutBox( songname, auth ),
            sub( context, index, auth, songname, playListId )
          ],
        ),
      ),
    );
  }

  Widget aboutBox( String songname, String auth ){
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("$songname", style: TextStyle( fontSize: ScreenUtil().setSp( 40 )), ),
          ),
          Text( auth, style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.grey ),)
        ],
      ),
    );
  }

  Widget sub( context, index, auth, songname, playListId ){
    List<int> iconData = [ 0xe61e, 0xe63f, 0xe75c, 0xe601, 0xe606, 0xe619, 0xe63c, 0xe625 ];
    List<String> textList = [ "下一首播放", "收藏到歌单", "下载", "评论", "分享", "歌手", "专辑", "查看视频", "删除" ];

    return Container(
      height: ScreenUtil().setHeight(170),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Container(
              height: ScreenUtil().setHeight(170),
              width: ScreenUtil().setWidth(100),
              alignment: Alignment.center,
              child: Icon( IconData( 0xe61e, fontFamily: 'iconfont' ), color: Colors.grey, ),
            )
          ),
          InkWell(
            onTap: (){
              myShowModal(
                context: context,
                iconList: iconData,
                textList: textList,
                titleText: songname
              ).then( ( int type ){
                if( type == null ){

                } else {
                  if( type == 0 ){
                    int nowPlayListId = Provide.value<PlayMusic>(context).playListId;
                    if( nowPlayListId != playListId ){
                      showDialog(
                        context: context,
                        builder: ( context ){
                          return AlertDialog(
                            title: Text("对不起..真的对不起..", style: TextStyle( fontSize: ScreenUtil().setSp(36), color: Colors.red, fontWeight: FontWeight.bold ),),
                            content: Text("暂时只能对当前播放列表有效，请到当前播放目录尝试....", maxLines: 4, style: TextStyle( fontSize: ScreenUtil().setSp(32) ),),
                          );
                        }
                      );
                    } else {
                      Provide.value<PlayMusic>(context).setCurrentIndex(index);
                      Fluttertoast.showToast(
                        msg: "已添加到下一首播放......",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIos: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: ScreenUtil().setSp(34)
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: ( context ){
                        return AlertDialog(
                          title: Text("抱歉,暂时只支持播放下一曲...", style: TextStyle( fontSize: ScreenUtil().setSp(36), color: Colors.red, fontWeight: FontWeight.bold ),),
                          content: Text("不好意思.....", style: TextStyle( fontSize: ScreenUtil().setSp(32) ),),
                        );
                      }
                    );
                  }
                }
              });
            },
            child: Container(
              height: ScreenUtil().setHeight(170),
              width: ScreenUtil().setWidth(100),
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(50)
              ),
              alignment: Alignment.center,
              child: Icon( IconData( 0xe6bf, fontFamily: 'iconfont' ), color: Colors.grey, ),
            )
          )
        ],
      ),
    );
  }


}










