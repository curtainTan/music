import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routers/route.dart';
import 'package:music/provider/inPlayList.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/play_music.dart';
import 'package:music/service/http.dart';




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
                return oneItem( index, context, data.tracks[index].name, data.tracks[index].ar[0].name, data.tracks[index].id );
              },
              childCount: data.tracks.length
            ),
          );
        }
      },
    );
  }


  Widget oneItem( int index, context, String songname, String auth, int id ){
    return InkWell(
      onTap: () async {
        // Routes.router.navigateTo(context, Routes.playpage);

        requestGet("songurl", formData: { "id" : id } ).then( ( res ){

          // print("-----${res['data'][0]['url']}---------获取的url数据是：${res}");
          
          Provide.value<PlayMusic>(context).setPlayUrl( res['data'][0]['url'] );

        } );

      },
      child: Container(
        height: ScreenUtil().setHeight(170),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(100),
              child: Text( "$index", style: TextStyle( fontSize: ScreenUtil().setSp( 50 ), color: Colors.grey ), ),
            ),
            aboutBox( songname, auth ),
            sub()
          ],
        ),
      ),
    );
  }

  Widget aboutBox( String songname, String auth ){
    return Expanded(
      // child: Container(
      //   alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // child: Text("歌曲名称", style: TextStyle( fontSize: ScreenUtil().setSp( 42 )), ),
              child: Text("$songname", style: TextStyle( fontSize: ScreenUtil().setSp( 40 )), ),
            ),
            Text( auth, style: TextStyle( fontSize: ScreenUtil().setSp( 32 ), color: Colors.grey ),)
          ],
        ),
      // ),
    );
  }

  Widget sub(){
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
            onTap: (){},
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










