import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class BodyBox extends StatelessWidget {
  final TabController tabController;

  BodyBox({Key key, this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TabBarView(
      controller: tabController,
      children: <Widget>[
        UserOne(),
        UserTwo(),
        UserThjree()
      ],
    );
  }
}



class UserOne extends StatelessWidget {
  final Widget child;

  UserOne({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(2920),
      child: Column(
        children: <Widget>[
          MyTitle(title: "电台",),
          MyTitle(title: "歌单",),
          MyTitle(title: "收藏的歌单",),
        ],
      )
    );
  }


}



class MyTitle extends StatelessWidget {
  final String title;

  MyTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth( 60 )
            ),
            child: Text("${title}", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(38) ), ),
          ),
          MyPageItem(),
          MyPageItem(),
          MyPageItem(),
          MyPageItem(),
        ],
      ),
    );
  }
}




class MyPageItem extends StatelessWidget {
  final Widget child;

  MyPageItem({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      margin: EdgeInsets.all( ScreenUtil().setWidth( 30 ) ),
      child: Row(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(170),
            width: ScreenUtil().setHeight(170),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(40),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular( 10 ),
              image: DecorationImage(
                image: NetworkImage("http://curtaintan.club/headImg/1549358122065.jpg"),
                fit: BoxFit.fitWidth
              )
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(20)
                  ),
                  child: Text("至死不渝的回答", style: TextStyle( fontSize: ScreenUtil().setSp(40) ),),
                ),
                Text("共0期，0人订阅", style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.grey ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}




class UserTwo extends StatelessWidget {
  final Widget child;

  UserTwo({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("第二页"),
    );
  }
}



class UserThjree extends StatelessWidget {
  final Widget child;

  UserThjree({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("第三页"),
    );
  }
}
