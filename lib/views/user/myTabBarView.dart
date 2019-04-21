import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/userData.dart';
import './aboutMe.dart';

import 'package:music/provider/inPlayList.dart';
import 'package:music/routers/route.dart';


class MySliverTabBarView extends StatelessWidget {

  final TabController tabController;

  MySliverTabBarView( this.tabController );


  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        MyOnePage(),
        MyTwoPage(),
        AboutMe(),
      ],
    );
  }
}





class MyOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView
                    .sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtil().setHeight( 40 ),
                ),
              ),
              OnePageTitle(title: "电台",),
              OnePageList(allnum: 0,),
              OnePageTitle(title: "歌单",),
              OnePageList(allnum: 1,),
              OnePageTitle(title: "收藏的歌单",),
              OnePageList(allnum: 2,),
            ],
          );
        },
      ),
    );
  }
}


class MyTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView
                    .sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtil().setHeight( 40 ),
                ),
              ),
              OnePageTitle(title: "电台",),
              OnePageList(allnum: 0,),
              OnePageTitle(title: "歌单",),
              OnePageList(allnum: 1,),
              OnePageTitle(title: "收藏的歌单",),
              OnePageList(allnum: 2,),
            ],
          );
        },
      ),
    );
  }
}



class OnePageTitle extends StatelessWidget {
  final String title;

  OnePageTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
          left: ScreenUtil().setWidth( 60 )
        ),
        child: Text("${title}", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(38) ), ),
      )
    );
  }
}


class OnePageList extends StatelessWidget {
  final int allnum;

  OnePageList({Key key, this.allnum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provide<UserDataProvide>(
      builder: ( context, child, userdata ){
        if( allnum == 0 ){
          return SliverPadding(
            padding: EdgeInsets.only(),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return MyPageDJItem(  );
                },
                childCount: 1,
              ),
            ),
          );
        }
        if( allnum == 1 && userdata.onlyMyPlayList != null ){
          return SliverPadding(
            padding: EdgeInsets.only(),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return MyPageItem( oneData: userdata.onlyMyPlayList[index], );
                },
                childCount: userdata.onlyMyPlayList.length,
              ),
            ),
          );
        }
        if( allnum == 2 && userdata.collectionPlayList != null ){
          return SliverPadding(
            padding: EdgeInsets.only(),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return MyPageItem( oneData: userdata.collectionPlayList[index] );
                },
                childCount: userdata.collectionPlayList.length,
              ),
            ),
          );
        }
        return SliverPadding(
          padding: EdgeInsets.only(),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: ScreenUtil().setHeight(200),
              child: Center(
                child: Text("加载中......"),
              ),
            ),
          ),
        );
      }
    );
  }
}


class MyPageItem extends StatelessWidget {

  var oneData;

  MyPageItem( { this.oneData } );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Provide.value<InPlayList>(context).setHeader( oneData.coverImgUrl, oneData.name, oneData.id );
        Routes.router.navigateTo(context, '/songList/' + oneData.id.toString() );
      },
      child: Container(
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
                  // image: NetworkImage("http://curtaintan.club/headImg/1549358122065.jpg"),
                  image: NetworkImage( oneData.coverImgUrl ),
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
                    child: Text( oneData.name , style: TextStyle( fontSize: ScreenUtil().setSp(40) ),),
                  ),
                  Text(
                    "${oneData.trackCount}首，by ${oneData.creator.nickname}，播放${oneData.playCount}次", 
                  style: TextStyle( fontSize: ScreenUtil().setSp(30), color: Colors.grey ),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}


class MyPageDJItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
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
      )
    );
  }
}


