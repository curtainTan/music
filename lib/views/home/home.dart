import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'dart:async';
import 'package:provide/provide.dart';


import './myDrawer.dart';
import './one_page.dart';
import './twopage/main.dart';
import 'package:music/provider/me.dart';
import './threepage/index.dart';
import 'package:music/component/bottomBar.dart';
import 'package:music/routers/route.dart';


class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  TabController _tabController;
  TabController _tabController1;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _tabController =TabController( length: 3, vsync: this );
    _tabController1 =TabController( length: 3, vsync: this );
    _timer = Timer( Duration( seconds: 2 ), onlyOne );
  }


  @override
  void dispose() {
    _timer.cancel();
    _tabController.dispose();
    _tabController1.dispose();
    super.dispose();
  }
  // 只执行一次 更新用户信息和cookie
  void onlyOne(){
    Provide.value<MeInfoProvide>(context).updateInfo();
    Provide.value<MeInfoProvide>(context).reSetCookie();
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
      onTap: (){
        Routes.router.navigateTo(context, Routes.searchpage );
      },
      child: Container(
        width: ScreenUtil().setWidth(140),
        height: ScreenUtil().setHeight(100),
        alignment: Alignment.center,
        child: Icon( IconData( 0xe653, fontFamily: 'iconfont' ) ),
      ),
    );
  }

  Future<bool> _onWillPop(){
    return showDialog(
      context: context,
      builder: ( context ) => AlertDialog(
        title: Text("你确定要退出吗？"),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context, true);
            },
            child: Text("确定"),
          ),
          FlatButton(
            onPressed: (){
              Navigator.pop(context, false);
            },
            child: Text("取消"),
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
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
        bottomSheet: BottomBar(  ),
      )
    );
  }
}

