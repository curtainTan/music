import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:extended_tabs/extended_tabs.dart';

import './myDrawer.dart';
import './one_page.dart';
import './twopage/main.dart';
import './threepage/index.dart';
import 'package:music/routers/route.dart';


import 'package:music/provider/inPlayList.dart';
import 'package:provide/provide.dart';
import 'package:music/service/http.dart';



class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _tabController;
  TabController _tabController1;

  @override
  void initState() {
    super.initState();
    _tabController =TabController( length: 3, vsync: this );
    _tabController1 =TabController( length: 3, vsync: this );

  }


  @override
  void dispose() {
    _tabController.dispose();
    _tabController1.dispose();
    super.dispose();
  }

  Widget topTabBar(){
    return Container(
      width: ScreenUtil().setWidth(500),
      height: ScreenUtil().setHeight(100),
      child: TabBar(
        indicator: BoxDecoration(
          color: Colors.red
        ),
        indicatorColor: Colors.white,
        controller: _tabController,
        indicatorWeight: 0.0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white30,
        tabs: <Widget>[
          Icon( IconData( 0xe680, fontFamily: 'iconfont' ), size: 22, ),
          Icon( IconData( 0xe602, fontFamily: 'iconfont' ), size: 22, ),
          Icon( IconData( 0xe7b3, fontFamily: 'iconfont' ), size: 22, ),
        ],
      ),
    );
  }

  Widget searchBar(){
    return InkWell(
      onTap: (){},
      child: Container(
        width: ScreenUtil().setWidth(140),
        height: ScreenUtil().setHeight(100),
        alignment: Alignment.center,
        child: Icon( IconData( 0xe653, fontFamily: 'iconfont' ) ),
      ),
    );
  }

  Widget _bottombar(){
    return GestureDetector(
      onTap: (){
        Routes.router.navigateTo(context, '/playpage' );
      },
      child: Container(
        height: ScreenUtil().setHeight(150),
        width: ScreenUtil().setWidth(1080),
        padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(28) ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity( 0.8 ),
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: Colors.black12
            )
          )
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(100),
              padding: EdgeInsets.only( right: ScreenUtil().setWidth(40) ),
              child: ClipOval(
                child: Image.network("http://curtaintan.club/headImg/1549358122065.jpg"),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("歌名"),
                  Text("演唱者", style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.grey ),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(40) ),
              child: Icon(  IconData( 0xe629, fontFamily: 'iconfont' ), color: Colors.black26, size: ScreenUtil().setSp(65), ),
            ),
            Container(
              padding: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(10) ),
              child: Icon(  IconData( 0xe617, fontFamily: 'iconfont' ), color: Colors.black45, size: ScreenUtil().setSp(65), ),
            )
          ],
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Colors.red,
           centerTitle: true,
           elevation: 0,
           title: topTabBar(),
           actions: <Widget>[
             searchBar(),
           ],
         ),
         drawer: MyDrawer(),
         body: Container(
           child: ExtendedTabBarView(
             controller: _tabController,
             children: <Widget>[
               OnePage(),
               HomeTwoPage( tabController: _tabController1, ),
               ThreePage()
             ],
           ),
         ),
         bottomSheet: _bottombar(),
       )
    );
  }
}

