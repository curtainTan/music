import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class InitSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth( 20 )
      ),
      child: Column(
        children: <Widget>[
          historyBox( context ),
          hotSearch()
        ],
      ),
    );
  }


  // 历史搜索
  Widget historyBox( context ){

    Widget _topBox(){
      return Container(
        height: ScreenUtil().setHeight(200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("历史记录", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(46) ),),
            IconButton(
              onPressed: (){},
              icon: Icon( Icons.delete ),
              iconSize: ScreenUtil().setSp(40),
            )
          ],
        )
      );
    }

    Widget historyList( context ){
      return Container(
        height: ScreenUtil().setHeight(200),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: ( context, index ){
            return Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(10)
              ),
              child: ActionChip(
                onPressed: (){},
                label: Text("History--$index", style: TextStyle( fontSize: ScreenUtil().setSp( 30 ) ),),
              )
            );
          },
        ),
      );
    }


    return Container(
      height: ScreenUtil().setHeight(400),
      child: Column(
        children: <Widget>[
          _topBox(),
          historyList( context )
        ],
      ),
    );
  }



  // 热门搜索框
  Widget hotSearch(){

    Widget _topBox(){
      return Container(
        alignment: Alignment.centerLeft,
        child: Text("热门搜索", style: TextStyle( fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(46) ),),
      );
    }

    Widget contentBox(){

      List<Widget> hotData =[];
      for( int i = 0; i < 10; i++ ){
        hotData..add( ActionChip(
          onPressed: (){},
          label: Text("热搜----$i"),
        ) );
      }

      return Container(
        height: ScreenUtil().setHeight(600),
        child: Wrap(
          spacing: ScreenUtil().setWidth( 20 ),
          children: hotData,
        ),
      );
    }


    return Container(
      height: ScreenUtil().setHeight(800),
      child: Column(
        children: <Widget>[
          _topBox(),
          contentBox()
        ],
      ),
    );
  }


}




















