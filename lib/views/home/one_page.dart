import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../provider/me.dart';
import 'package:provide/provide.dart';
import '../../service/http.dart';

import 'package:music/views/home/onepage/topCard.dart';
import './onepage/oneMidBox.dart';



class OnePage extends StatefulWidget {
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    yyy( context );
  }

  void yyy( context ) async {
    int uid = Provide.value<MeInfoProvide>(context).uid;
    await requestGet( "userPlaylist", formData: { "uid" : uid } ).then( (res){
      Provide.value<MeInfoProvide>(context).setPlayList(res);
    } );
  }

  @override 
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(1920),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          // topCard(),
          TopCard(),
          OneTopBox(),
          OneMidBox(),
        ],
      ),
    );
  }
}

class OneTopBox extends StatelessWidget {

  List icon = [ 0xe680, 0xe655, 0xe75c, 0xe68a, 0xe600 ];
  List text = [ "本地音乐", "最近播放", "下载管理", "我的电台", "我的收藏", ];
  List nums = [ 12,34,56,78,90 ];

  Widget item( int icon, String text, int nums ){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(150),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(120),
              child: Icon( IconData( icon, fontFamily: 'iconfont' ), size: 22, color: Colors.red, ),
            ),
            Container(
              width: ScreenUtil().setWidth( 950 ),
              height: ScreenUtil().setHeight(149),
              margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(10)
              ),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide( width: 0.5, color: Colors.black12 )
                )
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan( text: "$text", style: TextStyle( fontSize: ScreenUtil().setSp(40) ) ),
                    TextSpan( text: "($nums)", style: TextStyle( fontSize: ScreenUtil().setSp(36), color: Colors.grey ) ),
                  ]
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil().setHeight(20)
      ),
      height: ScreenUtil().setHeight( icon.length * 150.0 ),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: icon.length,
        itemBuilder: ( context, index ){
          return item( icon[index], text[index], nums[index] );
        },
      ),
    ); 
  }
}


