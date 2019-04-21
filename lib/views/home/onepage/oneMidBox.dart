import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart';
import 'package:music/provider/me.dart';
import 'package:music/service/http.dart';

import './myAnimate.dart';




class OneMidBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //   future: _getgedan(context),
    //   builder: ( BuildContext context, snapshot ){
    //     if( snapshot.hasData ){
    //       // print("------snapshot.data----------${ snapshot.data }");
    //       return Container(
    //         child: Column(
    //           children: <Widget>[
    //             MyAnimateZhuan( text: "创建的歌单", isMe: true, ),
    //             MyAnimateZhuan( text: "收藏的歌单", isMe: false, ),
    //             SizedBox(
    //               height: ScreenUtil().setHeight(150),
    //             )
    //           ],
    //         )
    //       );
    //     }else{
    //       print("------snapshot.data----------${ snapshot }");
    //       return Container(
    //         padding: EdgeInsets.only(
    //           top: ScreenUtil().setHeight(80)
    //         ),
    //         alignment: Alignment.center,
    //         child: Text("正在加载中......"),
    //       );
    //     }
    //   },
    // );
    return Container(
      child: Column(
        children: <Widget>[
          MyAnimateZhuan( text: "创建的歌单", isMe: true, ),
          MyAnimateZhuan( text: "收藏的歌单", isMe: false, ),
          SizedBox(
            height: ScreenUtil().setHeight(150),
          )
        ],
      )
    );
  }

  // Future<String> _getgedan( BuildContext context ) async {
  //   // int id = Provide.value<MeInfoProvide>(context).profile.userId;
  //   await requestGet( "userPlaylist", formData: { "uid" : 109496832 } ).then( (res){
  //     // print("获取歌单--------------结果>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  //     // print("--------------${res}");
  //     Provide.value<MeInfoProvide>(context).setPlayList(res);
  //   } );
  //   return "end";
  // }

}


