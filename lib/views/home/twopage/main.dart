import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:extended_tabs/extended_tabs.dart';
import 'package:provide/provide.dart';


import './t_one.dart';
import './t_two.dart';
import 'package:music/service/http.dart';
import 'package:music/provider/bannerProvider.dart';


class HomeTwoPage extends StatefulWidget {

  final TabController tabController;

  HomeTwoPage({Key key, this.tabController }) : super(key: key);

  _HomeTwoPageState createState() => _HomeTwoPageState();
}


class _HomeTwoPageState extends State<HomeTwoPage> with AutomaticKeepAliveClientMixin {

  @override 
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _gettuijian();
    _getBanner();
  }

  void _getBanner(  ) async {
    await requestGet( "banner" ).then( (res){
      Provide.value<BannerProvide>(context).setBanner( res );
    } );
  }

  void _gettuijian() async {
    await requestGet("personalized").then( (res){
      Provide.value<BannerProvide>(context).setTuijian( res );
    } );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(1080),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            alignment: Alignment.center,
            color: Colors.red,
            child: TabBar(
              controller: widget.tabController,
              indicatorWeight: 2.0,
              labelStyle: TextStyle( fontSize: ScreenUtil().setSp(45), fontWeight: FontWeight.bold, color: Colors.white ),
              unselectedLabelStyle: TextStyle( fontSize: ScreenUtil().setSp(45), fontWeight: FontWeight.w400, color: Colors.grey ),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
               Text("推荐"),
               Text("朋友"),
               Text("电台"),
             ],
            ),
          ),
          Expanded(
            child: ExtendedTabBarView(
              controller: widget.tabController,
              children: <Widget>[
                TOne(),
                TTwoPage(),
                Text("----data"),
              ],
            ),
          )
        ],
      )
    );
  }
}











