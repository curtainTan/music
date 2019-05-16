import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import 'package:music/provider/searchPageProvide.dart';


class InitSearchPage extends StatelessWidget {

  final functionInput;
  InitSearchPage({ this.functionInput });


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth( 20 )
        ),
        child: Column(
          children: <Widget>[
            historyBox( context ),
            hotSearch( context )
          ],
        ),
      )
    );
  }


  // 历史搜索
  Widget historyBox( context ){

    Widget _topBox(){
      return Container(
        height: ScreenUtil().setHeight(150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("历史记录", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(40) ),),
            IconButton(
              onPressed: (){},
              icon: Icon( Icons.delete ),
              iconSize: ScreenUtil().setSp(40),
            )
          ],
        )
      );
    }

    Widget historyList( context, List historyList ){
      return Container(
        height: ScreenUtil().setHeight(100),
        child: historyList.length == 0 ? Text( "暂无数据....." ) :
        ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: historyList.length,
          itemBuilder: ( context, index ){
            return Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(26)
              ),
              child: ActionChip(
                onPressed: (){
                  functionInput( historyList[index] );
                },
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10)
                ),
                backgroundColor: Colors.black12.withOpacity(0.1),
                label: Text( historyList[index] , style: TextStyle( fontSize: ScreenUtil().setSp( 30 ) ),),
              )
            );
          },
        ),
      );
    }


    return Provide<SearchPageProvide>(
      builder: ( context, child, data ){
        return Container(
          height: ScreenUtil().setHeight(300),
          child: Column(
            children: <Widget>[
              _topBox(),
              historyList( context, data.historyList )
            ],
          ),
        );
      },
    );
  }



  // 热门搜索框
  Widget hotSearch( context ){

    Widget _topBox(){
      return Container(
        alignment: Alignment.centerLeft,
        child: Text("热门搜索", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(40) ),),
      );
    }

    Widget contentBox( List<String> list ){

      List<Widget> hotData =[];
      for( int i = 0; i < list.length; i++ ){
        hotData..add( ActionChip(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10)
          ),
          onPressed: (){
            functionInput( list[i] );
          },
          label: Text("${list[i]}", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ) )),
        ) );
      }

      if( list.length == 0 ){
        return Container(
          width: double.infinity,
          height: ScreenUtil().setWidth(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  right: ScreenUtil().setWidth(40)
                ),
                height: ScreenUtil().setWidth(70),
                width: ScreenUtil().setWidth(70),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )
              ),
              Text("加载中...", style: TextStyle( color: Colors.red ), )
            ], 
          )
        );
      }

      return Container(
        height: ScreenUtil().setHeight(600),
        alignment: Alignment.topLeft,
        child: Wrap(
          spacing: ScreenUtil().setWidth( 20 ),
          children: hotData,
        ),
      );
    }


    return Provide<SearchPageProvide>(
      builder: ( context, child, data ){
        return Container(
          height: ScreenUtil().setHeight(800),
          child: Column(
            children: <Widget>[
              _topBox(),
              contentBox( data.searchHotList )
            ],
          ),
        );
      },
    );
  }


}




















