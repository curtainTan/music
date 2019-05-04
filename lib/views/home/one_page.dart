import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../provider/me.dart';
import 'package:provide/provide.dart';
import '../../service/http.dart';


import './onepage/oneMidBox.dart';



class OnePage extends StatefulWidget {
  _OnePageState createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    yyy();
  }

  void yyy() async {
    // print("---------------第一页重新请求了");
    await requestGet( "userPlaylist", formData: { "uid" : 109496832 } ).then( (res){
      Provide.value<MeInfoProvide>(context).setPlayList(res);
    } );
  }

  @override 
  bool get wantKeepAlive => true;

  Widget topCard(){

    Widget cardLeft( ){
      // var img = Provide.value<MeInfoProvide>(context).profile?.avatarUrl;
      // if( img == null ){
      //   img = "http://curtaintan.club/headImg/1549358122065.jpg";
      // }
      return Container(
        child: Row(
          children: <Widget>[
            ClipOval(
              child: Image.network(
                "http://curtaintan.club/headImg/1549358122065.jpg",
                // img,
                width: ScreenUtil().setWidth(130),
                height: ScreenUtil().setHeight(130),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(30),
            ),
            Text("至死不渝的回答", style: TextStyle( fontSize: ScreenUtil().setSp(40) ),)
          ],
        ),
      );
    }

    Widget cardRight(){
      return Container(
        width: ScreenUtil().setWidth(210),
        height: ScreenUtil().setHeight(80),
        child: FlatButton(
          onPressed: (){
            print("签到");
            var ss = Provide.value<MeInfoProvide>(context).profile.backgroundUrl;
            print("背景图片地址： ${ ss }");
          },
          textColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(20),
            side: BorderSide(
              width: 1.0,
              color: Colors.red
            )
          ),
          child: Text("开通会员", style: TextStyle( fontSize: ScreenUtil().setSp(28) ), ),
        )
      );
    }

    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(100),
          width: ScreenUtil().setWidth(1080),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: Container(
            height: ScreenUtil().setHeight(200),
            width: ScreenUtil().setWidth(1080),
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all( Radius.circular(6) ),
              boxShadow: [
                BoxShadow( offset: Offset(0, 4.0), color: Colors.black12, blurRadius: 5 )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                cardLeft(),
                cardRight()
              ],
            ),
          )
        )
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setHeight(1920),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          topCard(),
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


