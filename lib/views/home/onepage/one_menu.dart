import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:provide/provide.dart';

import 'package:music/provider/inPlayList.dart';
import 'package:music/routers/route.dart';
import 'package:music/component/myImage.dart';

import 'package:music/commonFunc/bottomModal.dart';



class OneMenu extends StatelessWidget {

  String imageUrl, title;
  int id, index;
  bool isMe;

  OneMenu({Key key, this.imageUrl,this.title, this.id, this.isMe, this.index }) : super(key: key);

  Widget headImg( context, dd ){
    return Container(
      width: ScreenUtil().setHeight(140),
      height: ScreenUtil().setHeight(140),
      margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all( Radius.circular( ScreenUtil().setWidth(10) ) ),
      //   image: DecorationImage(
      //     fit: BoxFit.fitHeight,
      //     // image: NetworkImage("http://curtaintan.club/headImg/1549358122065.jpg"),
      //     image: NetworkImage( imageUrl ),
      //   )
      // ),
      // child: ExtendedImage.network(
      //   imageUrl,
      //   fit: BoxFit.cover,
      //   cache: true,
      //   width: ScreenUtil().setWidth(140),
      //   height: ScreenUtil().setHeight(140),
      //   shape: BoxShape.rectangle,
      //   borderRadius: BorderRadius.all( Radius.circular( ScreenUtil().setWidth(10) ) ),
      // ),
      child: MyImage(
        h: ScreenUtil().setHeight(140),
        w: ScreenUtil().setHeight(140),
        shape: BoxShape.rectangle,
        url: imageUrl,
        b: BoxFit.cover,
        br: ScreenUtil().setWidth(10),
      ),
    );
  }
  Widget midabout(){
    return Container(
      height: ScreenUtil().setHeight(160),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${ title }", style: TextStyle( fontSize: ScreenUtil().setSp(38) ), ),
          Text("126首，已下载66首", style: TextStyle( fontSize: ScreenUtil().setSp(32), color: Colors.grey ), ),
        ],
      ),
    );
  }

  Widget _left( context, title ){
    return Container(
      width: ScreenUtil().setWidth( 900 ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide( width: 0.5, color: Colors.black12 )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          midabout(),
          _right( context, title )
        ],
      ),
    );
  }

  Widget _right( context, title ){
    List<int> iconData = [ 0xe7ef, 0xe606, 0xe658, 0xe650 ];
    List<String> textList = [ "下载", "分享", "编辑歌单信息", "删除" ];


    return InkWell(
      onTap: (){
        myShowModal(
          context: context,
          iconList: iconData,
          textList: textList,
          titleText: "歌单：$title"
        );
      },
      child: Container(
        width: ScreenUtil().setWidth( 100 ),
        alignment: Alignment.center,
        child: Icon( IconData( 0xe6bf, fontFamily: 'iconfont' ), size: ScreenUtil().setSp( 60 ), color: Colors.grey ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Provide.value<InPlayList>(context).setHeader( imageUrl, title, id);
        Routes.router.navigateTo(context, '/songList/' + id.toString() ,  );
        
      },
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(160),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            headImg( context, 133953518 ),
            _left( context, title )
          ],
        ),
      )
    );
  }
}

