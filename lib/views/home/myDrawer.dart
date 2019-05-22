import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';


import 'package:music/routers/route.dart';
import 'package:music/provider/me.dart';
import 'package:music/provider/userData.dart';


 // 所有小部件
class MyDrawer extends StatelessWidget {

  List icon1 = [ 0xe636, 0xe619 , 0xe75e , 0xe639 , 0xe637 ];
  List text1 = [ "我的消息", "会员中心" , "云村有票" , "商城" , "游戏推荐" ];
  List righttext1 = [ "", "vip限时赠送" , "草莓音乐节" , "运动蓝牙5折" , "" ];

  List icon2 = [ 0xe62f, 0xe621 ];
  List text2 = [ "我的好友", "附近的人" ];
  List righttext2 = [ "", "" ];

  List icon3 = [ 0xe62f, 0xe649, 0xe605, 0xe63a, 0xe63c, 0xe63e, 0xeb91 ];
  List text3 = [ "个性换肤", "扫一扫", "定时播放", "音乐闹钟", "小冰电台", "音乐云盘", "优惠券" ];
  List righttext3 = [ "官方红", "", "", "", "", "", "", ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(),
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(1800),
            child: ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.only(),
              children: <Widget>[
                _mydrawerHeader( context ),
                _topBox( icon1, text1, righttext1 ),
                _topBox( icon2, text2, righttext2 ),
                _topBox( icon3, text3, righttext3 ),
              ],
            ),
          ),
          _myFoot( context )
        ],
      ),
    );
  }

  // 脚部
  Widget _myFoot( context ){

    Widget footItem( int icon, String text ){
      return  Container(
          width: ScreenUtil().setWidth(280),
          height: ScreenUtil().setHeight(110),
          padding: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(100),
                child: Icon( 
                  IconData( icon, fontFamily: 'iconfont' ),
                  size: 22,
                )
              ),
              Text("$text")
            ],
          ),
      );
    }

    Widget footLeft( ){
      return Container(
        child: Row(
          children: <Widget>[
            footItem( 0xe638, "夜间模式" ),
            footItem( 0xe64b, "设置" ),
          ],
        ),
      );
    }

    return Container(
      height: ScreenUtil().setHeight( 110 ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          footLeft(),
          InkWell(
            child: footItem( 0xe634, "退出" ),
            onTap: (){
              print("我点了退出");
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: ( context ){
                  return AlertDialog(
                    title: Text("----小提示----", style: TextStyle( fontWeight: FontWeight.bold ),),
                    content: Text("你确定要退出吗？"),
                    actions: <Widget>[
                      RaisedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("取消", style: TextStyle( color: Colors.white ),),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          SharedPreferences pref = await SharedPreferences.getInstance();
                          pref.clear();
                          Routes.router.navigateTo(context, Routes.login, clearStack: true  );

                        },
                        child: Text("确定", style: TextStyle( color: Colors.white ),),
                      )
                    ],
                  );
                }
              );
            },
          )
        ],
      ),
    );
  }

  // 头部
  Widget _mydrawerHeader( context ){
    return Provide<MeInfoProvide>(
      builder: ( context, child, data ){
        return DrawerHeader(
          padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://www.curtaintan.club/bg/m2.jpg",
              ),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    print("点了一下头像区....");
                    Provide.value<UserDataProvide>(context).initUserData( data.profile.nickname, data.profile.avatarUrl);
                    Routes.router.navigateTo(context, "/user/" + data.profile.userId.toString() );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: ClipOval(
                      child: Image.network(
                        data?.profile?.avatarUrl ?? "http://curtaintan.club/headImg/1549358122065.jpg",
                        width: ScreenUtil().setWidth(150),
                        height: ScreenUtil().setHeight(150),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text( data?.profile?.nickname ?? "至死不渝的回答", style: TextStyle( color: Colors.white, fontSize: ScreenUtil().setSp(40) ),),
                      Container(
                        width: ScreenUtil().setWidth(180),
                        height: ScreenUtil().setHeight(80),
                        child: FlatButton(
                          onPressed: (){
                            print("签到");
                            Routes.router.navigateTo(context, "/mvs");
                          },
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            side: BorderSide(
                              width: 1.0,
                              color: Colors.white
                            )
                          ),
                          child: Text("签到",),
                        )
                      ),
                    ],
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _topBox( List icon, List text, List righttext ){

    return Container(
      height: ScreenUtil().setHeight( icon.length * 112.0 ),
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(),
        itemCount: icon.length,
        itemBuilder: ( context, index ){
          return _itemView( icon[index], text[index], righttext[index] );
        },
      )
    );
  }

  Widget _itemView( int icon, String text, String other ){
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          item_left(  icon, text  ),
          item_right( other ),
        ],
      ),
    );
  }

  Widget item_right( String other ){
    if( other == "" ){
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.only(right: 10),
        child: Text("${ other }", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ), color: Colors.grey ),)
      );
    }
  }

  Widget item_left( int icon, String text ){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(100),
            child: Icon(
              IconData( icon, fontFamily: 'iconfont' ),
              size: 20,
            ),
          ),
          Text( "${ text }" )
        ],
      ),
    );
  }

}



